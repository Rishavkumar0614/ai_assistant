import 'package:ai_assistant/models/chat_message.dart';

class User {
  final int _userid;
  final String _name;
  final String _username;
  final List<int> _registeredServices;
  final List<List<List<ChatMessage>>> _chats;

  User({required String name, required String username, required int userid})
      : _chats = [],
        _name = name,
        _userid = userid,
        _username = username,
        _registeredServices = [];

  Map<String, dynamic> toJson() => {
        "name": _name,
        "chats": _chats,
        "userid": _userid,
        "username": _username,
      };

  getName() {
    return _name;
  }

  getUserId() {
    return _userid;
  }

  getUsername() {
    return _username;
  }

  bool isServiceRegistered(int serviceid) {
    return (serviceid < _chats.length);
  }

  bool isChatRegistered(int serviceid, int chatid) {
    if (isServiceRegistered(serviceid)) {
      return (chatid < _chats[serviceid].length);
    }
    return false;
  }

  bool isMessageRegistered(int serviceid, int chatid, int messageid) {
    if (isChatRegistered(serviceid, chatid)) {
      return (messageid < _chats[serviceid][chatid].length);
    }
    return false;
  }

  ChatMessage? getChatMessage(int serviceid, int chatid, int messageid) {
    if (isMessageRegistered(serviceid, chatid, messageid)) {
      return _chats[serviceid][chatid][messageid];
    }
    return null;
  }

  void updateChatMessage(
      int serviceid, int chatid, int messageid, ChatMessage message) {
    if (isMessageRegistered(serviceid, chatid, messageid)) {
      _chats[serviceid][chatid][messageid] = message;
    }
  }

  void registerService(int serviceid) {
    if (!isServiceRegistered(serviceid)) {
      _registeredServices.add(serviceid);
      for (int i = 0; i <= (serviceid - _chats.length); i++) {
        _chats.add([]);
      }
    }
  }

  int insertChatMessage(int serviceid, int chatid, ChatMessage message) {
    if (isChatRegistered(serviceid, chatid)) {
      _chats[serviceid][chatid].add(message);
      return (_chats[serviceid][chatid].length - 1);
    }
    return -1;
  }

  int createNewChat(int serviceId) {
    if (isServiceRegistered(serviceId)) {
      _chats[serviceId].add([]);
      return (_chats[serviceId].length - 1);
    }
    return -1;
  }

  List<ChatMessage> getChat(int serviceId, int chatId) {
    if (isChatRegistered(serviceId, chatId)) {
      return _chats[serviceId][chatId];
    }
    return [];
  }

  int nChats(int serviceId) {
    if (isServiceRegistered(serviceId)) {
      return _chats[serviceId].length;
    }
    return 0;
  }

  int nMessages(int serviceid, int chatid) {
    if (isChatRegistered(serviceid, chatid)) {
      return _chats[serviceid][chatid].length;
    }
    return 0;
  }

  List<int> getRegisteredServices() {
    return _registeredServices;
  }
}
