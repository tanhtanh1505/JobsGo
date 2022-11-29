import 'package:jobsgo/models/message/message_response.dart';
import 'package:jobsgo/models/user/user.dart';

// String ConversationModelToJson(ConversationModel data) =>
//     json.encode(data.toJson());

class ConversationModel {
  ConversationModel({
    required this.id,
    required this.lastMsg,
    required this.firstUser,
    required this.secondUser,
    required this.other,
    required this.lastMessage,
    required this.createdAt,
    required this.updatedAt,
  });

  String id;
  String? lastMsg;
  String firstUser;
  String secondUser;
  UserModel other;
  MessageModel? lastMessage;
  DateTime createdAt;
  DateTime updatedAt;

  factory ConversationModel.fromJson(Map<String, dynamic> json) =>
      ConversationModel(
        id: json["id"],
        lastMsg:
            json["lastMsg"] != null && json["lastMsg"].toString().isNotEmpty
                ? json["lastMsg"]
                : null,
        firstUser: json["firstUser"],
        secondUser: json["secondUser"],
        other: UserModel.fromJson(json["other"]),
        lastMessage: json["lastMessage"] != null &&
                json["lastMessage"].toString().isNotEmpty
            ? MessageModel.fromJson(json["lastMessage"])
            : null,
        createdAt: DateTime.parse(json["createdAt"]),
        updatedAt: DateTime.parse(json["updatedAt"]),
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "lastMsg": lastMsg,
        "firstUser": firstUser,
        "secondUser": secondUser,
        "other": other.toJson(),
        "lastMessage": lastMessage?.toJson(),
        "createdAt": createdAt.toIso8601String(),
        "updatedAt": updatedAt.toIso8601String(),
      };
}
