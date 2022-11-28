import 'dart:convert';

import 'package:jobsgo/config.dart';
import 'package:jobsgo/helper/uri_helper.dart';
import 'package:jobsgo/models/conversation/conversation.dart';
import 'package:jobsgo/models/message/message_response.dart';
import 'package:jobsgo/services/shared_service.dart';
import 'package:http/http.dart' as http;

class ChatService {
  static var client = http.Client();

  static Future<List<ConversationModel>> getListConversation() async {
    var loginDetails = await SharedService.loginDetails();

    Map<String, String> requestHeader = {
      'Content-Type': 'application/json',
      'Authorization': 'Bearer ${loginDetails?.accessToken}',
    };

    var url = UriHelper.getUri('${Config.chatAPI}/list-conversations');
    var response = await client.get(url, headers: requestHeader);
    List<ConversationModel> listConversations = [];
    var conversationsJson = jsonDecode(response.body);
    for (var item in conversationsJson) {
      listConversations.add(ConversationModel.fromJson(item));
    }

    return listConversations;
  }

  static Future<List<MessageModel>> getListMessage(
      String conversationId) async {
    var loginDetails = await SharedService.loginDetails();

    Map<String, String> requestHeader = {
      'Content-Type': 'application/json',
      'Authorization': 'Bearer ${loginDetails?.accessToken}',
    };

    var url =
        UriHelper.getUri('${Config.chatAPI}/conversation/$conversationId');
    var response = await client.get(url, headers: requestHeader);
    List<MessageModel> listMessages = [];
    var conversationsJson = jsonDecode(response.body);
    for (var item in conversationsJson) {
      listMessages.add(MessageModel.fromJson(item));
    }

    return listMessages;
  }

  static Future<ConversationModel> getConversationWith(String userId) async {
    var loginDetails = await SharedService.loginDetails();

    Map<String, String> requestHeader = {
      'Content-Type': 'application/json',
      'Authorization': 'Bearer ${loginDetails?.accessToken}',
    };

    var url = UriHelper.getUri('${Config.chatAPI}/conversation');
    var response = await client.post(url,
        headers: requestHeader, body: jsonEncode({"friendId": userId}));
    if (response.statusCode >= 300) {
      response = await client.post(url,
          headers: requestHeader, body: jsonEncode({"friendId": userId}));
    }

    ConversationModel conversationModel =
        ConversationModel.fromJson(jsonDecode(response.body));

    return conversationModel;
  }
}
