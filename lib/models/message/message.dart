import 'dart:convert';

Message messageFromJson(String str) => Message.fromJson(json.decode(str));

String messageToJson(Message data) => json.encode(data.toJson());

class Message {
  Message({
    required this.sender,
    required this.content,
    required this.status,
  });

  String sender;
  String content;
  String status;

  factory Message.fromJson(Map<String, dynamic> json) {
    try {
      return Message(
        sender: json["sender"],
        content: json["content"],
        status: json["status"],
      );
    } catch (err) {
      return failureMessage;
    }
  }

  Map<String, dynamic> toJson() => {
        "sender": sender,
        "content": content,
        "status": status,
      };
}

Message failureMessage = Message(sender: 'xxx', content: 'xxx', status: 'xxx');
