const ChatService = require("./chat_service.js");
const Response = require("../../models/response.js");

class Server {
    serve(requestData, callback) {
        switch (requestData.getUrl()) {
            case 'saveMessage':
                ChatService.insertChatMessage(requestData.getData()["userid"], requestData.getData()["serviceid"], requestData.getData()["chatid"],
                    requestData.getData()["messageid"], requestData.getData()["content"], requestData.getData()["status"], (response) => {
                        callback(new Response(200, 'text/plain', response));
                    });
                break;

            case 'fetchMessages':
                ChatService.fetchMessages(requestData.getData()["userid"], requestData.getData()["serviceid"], requestData.getData()["chatid"], (response) => {
                    callback(new Response(200, 'text/plain', response));
                });
                break;

            case 'fetchChats':
                ChatService.fetchChats(requestData.getData()['userid'], requestData.getData()['serviceid'], (response) => {
                    callback(new Response(200, 'text/plain', response));
                });
                break;

            default:
                callback(new Response(404, 'text/html', 'Service Not Found'));
        }
    }
};

module.exports = Server;