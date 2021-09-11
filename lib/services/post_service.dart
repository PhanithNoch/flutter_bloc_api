import 'package:blog_app/models/post_model.dart';
import 'package:blog_app/repository/post_repository.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

class PostService implements PostRepository {
  @override
  Future<List<PostModel>> getAllPost() async {
    var url = Uri.parse('https://jsonplaceholder.typicode.com/posts');
    http.Response response = await http.get(url);
    List lstPosts = json.decode(response.body);
    List<PostModel> posts =
        lstPosts.map((post) => PostModel.fromJson(post)).toList();
    return posts;
  }
}
