import 'package:jobsgo/models/post.dart';
import 'package:http/http.dart' as http;

class RemoteService {
  Future<List<Post>?> getPosts() async {
    var client = http.Client();

    var uri = Uri.parse("https://jsonplaceholder.typicode.com/posts");
    var res = await client.get(uri);
    if (res.statusCode == 200) {
      var json = res.body;
      return postFromJson(json);
    }
    return null;
  }
}
