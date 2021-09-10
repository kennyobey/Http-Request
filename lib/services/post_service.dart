import 'package:fetch_post/models/post_model.dart';
import 'package:http/http.dart' as http;

class PostService {
  Future<List<Post>> getPost() async {
    var response =
        await http.get(Uri.https('jsonplaceholder.typicode.com', 'posts'));
    List<Post> posts = postFromJson(response.body);
    return posts;
  }
}
