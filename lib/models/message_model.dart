import 'dart:convert';

MessageModel messageModelFromJson(String str) =>
    MessageModel.fromJson(json.decode(str));

String messageModelToJson(MessageModel data) => json.encode(data.toJson());

MessageModel failureMessage =
    MessageModel(senderId: 'xxx', recieverId: 'xxx', msg: 'xxx');

class MessageModel {
  MessageModel({
    required this.senderId,
    required this.recieverId,
    required this.msg,
  });

  String senderId;
  String recieverId;
  String msg;

  factory MessageModel.fromJson(Map<String, dynamic> json) {
    try {
      return MessageModel(
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
