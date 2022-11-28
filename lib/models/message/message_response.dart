import 'dart:convert';

MessageModel messageModelFromJson(String str) =>
    MessageModel.fromJson(json.decode(str));

String messageModelToJson(MessageModel data) => json.encode(data.toJson());

class MessageModel {
  MessageModel({
    required this.id,
    required this.conversationId,
    required this.content,
    required this.sender,
    required this.status,
    required this.createdAt,
  });

  String id;
  String conversationId;
  String content;
  String sender;
  String status;
  DateTime createdAt;

  factory MessageModel.fromJson(Map<String, dynamic> json) {
    return MessageModel(
      id: json["id"],
      conversationId: json["conversationId"],
      content: json["content"],
      sender: json["sender"],
      status: json["status"],
      createdAt: DateTime.parse(json["createdAt"]),
    );
  }

  Map<String, dynamic> toJson() => {
        "id": id,
        "conversationId": conversationId,
        "content": content,
        "sender": sender,
        "status": status,
        "createdAt": createdAt.toIso8601String(),
      };
}
