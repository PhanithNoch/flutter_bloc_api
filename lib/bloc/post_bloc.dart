import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:blog_app/models/post_model.dart';
import 'package:blog_app/repository/post_repository.dart';
import 'package:meta/meta.dart';

part 'post_event.dart';
part 'post_state.dart';

class PostBloc extends Bloc<PostEvent, PostState> {
  PostBloc(this.postRepo) : super(PostInitial());
  final PostRepository postRepo;
  List<PostModel>? posts;
  @override
  Stream<PostState> mapEventToState(
    PostEvent event,
  ) async* {
    yield PostLoading();
    try {
      posts = await postRepo.getAllPost();
      print(posts);
      yield PostLoaded(posts: posts!);
    } catch (ex) {
      print(ex);
      yield PostError();
    }
  }
}
