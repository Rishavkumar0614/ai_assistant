const fs = require('fs');
const Response = require("../models/response.js");

class Server {
    serve(requestData, callback) {
        if (fs.existsSync(`./assets/${requestData.getUrl()}`)) {
            callback(new Response(200, Response.getContentTypeByFileName(requestData.getUrl()), fs.readFileSync(`./assets/${requestData.getUrl()}`)));
        } else {
            callback(new Response(404, 'text/html', 'File Not Found'));
        }
    }
};

module.exports = Server;