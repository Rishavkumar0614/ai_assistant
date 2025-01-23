const bcrypt = require('bcrypt');

function hash_password(password) {
    const saltRounds = 10;
    return bcrypt.hashSync(password, saltRounds);
}

module.exports = { hash_password };