class ChatMessage {
  final String _text;
  final bool _isError;
  final bool _isSentByUser;
  final int _userid, _serviceid, _chatid, _messageid;

  ChatMessage(
      {required String text,
      required bool isError,
      required bool isSentByUser,
      required int userid,
      required int serviceid,
      required int chatid,
      required int messageid})
      : _text = text,
        _userid = userid,
        _chatid = chatid,
        _isError = isError,
        _serviceid = serviceid,
        _messageid = messageid,
        _isSentByUser = isSentByUser;

  String getText() {
    return _text;
  }

  bool getIsError() {
    return _isError;
  }

  bool getIsSentByUser() {
    return _isSentByUser;
  }

  int getUserid() {
    return _userid;
  }

  int getServiceid() {
    return _serviceid;
  }

  int getChatid() {
    return _chatid;
  }

  int getMessageid() {
    return _messageid;
  }
}
