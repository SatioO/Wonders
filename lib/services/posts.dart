import 'package:http/http.dart' as http;

class PostsService {
  static Future<http.Response> getPosts() async {
    return await http.get("https://jsonplaceholder.typicode.com/posts");
  }
}
