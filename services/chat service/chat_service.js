const MySQLController = require("../../controllers/mysql_controller.js");

class ChatService {
    static insertChatMessage(userid, serviceid, chatid, messageid, content, _status, callback) {
        MySQLController.connect((status, result) => {
            if (status) {
                const connectionObj = result;
                connectionObj.query(`
                                SELECT * FROM ai_assistant.users_messages WHERE userid = '${userid}' AND serviceid = '${serviceid}' AND chatid = '${chatid}' AND messageid = '${messageid}';
                                `, (err, result) => {
                    if (!err && result.length == 0) {
                        connectionObj.query(`
                                            INSERT INTO ai_assistant.users_messages (userid, serviceid, chatid, messageid, content, status) VALUES (
                                                '${userid}',
                                                '${serviceid}',
                                                '${chatid}',
                                                '${messageid}',
                                                '${content}',
                                                '${_status}'
                                            );
                                            `, (err, result) => {
                            if (!err) {
                                callback('MESSAGE SAVED');
                            } else {
                                callback('SOMETHING WENT WRONG');
                            }
                            connectionObj.end();
                        });
                    } else {
                        if (result.length != 0) {
                            callback('A MESSAGE ALREADY EXISTS WITH SAME MESSAGE ID');
                        } else {
                            callback('SOMETHING WENT WRONG');
                        }
                        connectionObj.end();
                    }
                });
            } else {
                callback('SOMETHING WENT WRONG');
            }
        });
    }

    static fetchChats(userid, serviceid, callback) {
        MySQLController.connect((status, result) => {
            if (status) {
                const connectionObj = result;
                connectionObj.query(`
                    SELECT DISTINCT(chatid) FROM ai_assistant.users_messages WHERE userid = ${userid} AND serviceid = ${serviceid};
                    `, (err, result) => {
                    if (!err) {
                        let response = [];
                        for (let i = 0; i < result.length; i++) {
                            response.push({ 'chatid': result[i]['chatid'] });
                        }
                        callback(JSON.stringify(response));
                    } else {
                        callback('SOMETHING WENT WRONG');
                    }
                    connectionObj.end();
                });
            } else {
                callback('SOMETHING WENT WRONG');
            }
        });
    }

    static fetchMessages(userid, serviceid, chatid, callback) {
        MySQLController.connect((status, result) => {
            if (status) {
                const connectionObj = result;
                connectionObj.query(`
                    SELECT * FROM ai_assistant.users_messages WHERE userid = ${userid} AND serviceid = ${serviceid} AND chatid = ${chatid};
                    `, (err, result) => {
                    if (!err) {
                        let response = [];
                        for (let i = 0; i < result.length; i++) {
                            response.push({ 'messageid': result[i]['messageid'], 'content': result[i]['content'], 'status': result[i]['status'] });
                        }
                        callback(JSON.stringify(response));
                    } else {
                        callback('SOMETHING WENT WRONG');
                    }
                });
            } else {
                callback('SOMETHING WENT WRONG');
            }
        });
    }
};

module.exports = ChatService;