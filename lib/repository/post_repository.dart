import 'package:blog_app/models/post_model.dart';

abstract class PostRepository {
  Future<List<PostModel>> getAllPost();
}
