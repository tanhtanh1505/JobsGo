import 'dart:convert';

Message messageFromJson(String str) => Message.fromJson(json.decode(str));

String messageToJson(Message data) => json.encode(data.toJson());

class Message {
  Message({
    required this.senderId,
    required this.recieverId,
    required this.msg,
  });

  String senderId;
  String recieverId;
  String msg;

  factory Message.fromJson(Map<String, dynamic> json) {
    try {
      return Message(
        senderId: json["senderId"],
        recieverId: json["recieverId"],
        msg: json["msg"],
      );
    } catch (err) {
      return failureMessage;
    }
  }

  Map<String, dynamic> toJson() => {
        "senderId": senderId,
        "recieverId": recieverId,
        "msg": msg,
      };
}

Message failureMessage =
    Message(senderId: 'xxx', recieverId: 'xxx', msg: 'xxx');
