const bcrypt = require('bcrypt');
const { hash_password } = require('../../commons.js');
const MySQLController = require("../../controllers/mysql_controller.js");

class UserService {
    static isUserExists(username, callback) {
        MySQLController.connect((status, result) => {
            if (status) {
                let connectionObj = result;
                connectionObj.query(`
                                SELECT * FROM ai_assistant.users_credentials WHERE username = '${username}';
                                `, (err, result) => {
                    if (!err) {
                        callback(result.length != 0);
                    } else {
                        callback(false);
                    }
                    connectionObj.end();
                });
            } else {
                callback(false);
            }
        });
    }

    static login(username, password, callback) {
        MySQLController.connect((status, result) => {
            if (status) {
                const connectionObj = result;
                UserService.isUserExists(username, (status) => {
                    if (status) {
                        connectionObj.query(`
                                    SELECT * FROM ai_assistant.users_credentials WHERE username = '${username}';
                                    `, (err, result) => {
                            if (!err) {
                                if (result.length == 1 && bcrypt.compareSync(password, result[0]["password"])) {
                                    let userid = result[0]["userid"];
                                    connectionObj.query(`
                                                SELECT * FROM ai_assistant.users_basic_info WHERE userid = '${userid}';
                                                `, (err, result) => {
                                        if (!err) {
                                            callback(JSON.stringify({ 'name': result[0]["name"], 'username': result[0]["username"], 'userid': userid }));
                                            connectionObj.end();
                                        } else {
                                            callback('SOMETHING WENT WRONG');
                                            connectionObj.end();
                                        }
                                    });
                                } else {
                                    if (result.length != 1) {
                                        callback('SOMETHING WENT WRONG');
                                    } else {
                                        callback('WRONG PASSWORD');
                                    }
                                    connectionObj.end();
                                }
                            } else {
                                callback('SOMETHING WENT WRONG');
                                connectionObj.end();
                            }
                        });
                    } else {
                        callback('USER DOES NOT EXISTS');
                        connectionObj.end();
                    }
                });
            }
        });
    }

    static signup(name, username, password, callback) {
        MySQLController.connect((status, result) => {
            if (status) {
                const connectionObj = result;
                UserService.isUserExists(username, (status) => {
                    if (!status) {
                        connectionObj.query(`
                                    INSERT INTO ai_assistant.users_credentials (username, password) VALUES (
                                        '${username}',
                                        '${hash_password(password)}'
                                    );
                                    `, (err, result) => {
                            if (!err) {
                                connectionObj.query(`
                                            SELECT userid FROM ai_assistant.users_credentials WHERE username = '${username}';
                                            `, (err, result) => {
                                    if (!err) {
                                        let userid = result[0]["userid"];
                                        connectionObj.query(`
                                                    INSERT INTO ai_assistant.users_basic_info (name, username, userid) VALUES
                                                    (
                                                        '${name}',
                                                        '${username}',
                                                        '${userid}'
                                                    );
                                                    `, (err, result) => {
                                            if (!err) {
                                                callback(JSON.stringify({ 'name': name, 'username': username, 'userid': userid }));
                                                connectionObj.end();
                                            } else {
                                                connectionObj.query(`
                                                    DELETE FROM ai_assistant.users_credentials WHERE username = '${username}';
                                                    `, (err, result) => {
                                                    if (!err) {
                                                        callback('SOMETHING WENT WRONG');
                                                    } else {
                                                        callback('SOMETHING WENT WRONG');
                                                    }
                                                    connectionObj.end();
                                                });
                                            }
                                        });
                                    }
                                    else {
                                        connectionObj.query(`
                                            DELETE FROM ai_assistant.users_credentials WHERE username = '${username}';
                                            `, (err, result) => {
                                            if (!err) {
                                                callback('SOMETHING WENT WRONG');
                                            } else {
                                                callback('SOMETHING WENT WRONG');
                                            }
                                            connectionObj.end();
                                        });
                                    }
                                });
                            } else {
                                callback('SOMETHING WENT WRONG');
                                connectionObj.end();
                            }
                        });
                    } else {
                        callback('USER ALREADY EXISTS');
                        connectionObj.end();
                    }
                });
            }
        });
    }
};

module.exports = UserService;