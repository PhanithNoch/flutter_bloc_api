import 'package:blog_app/services/post_service.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'bloc/post_bloc.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(),
      home: BlocProvider<PostBloc>(
          create: (context) => PostBloc(PostService())..add(GetPostEvent()),
          child: Home()),
    );
  }
}

class Home extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text("Home Screen"),
        ),
        body: BlocBuilder<PostBloc, PostState>(
          builder: (BuildContext context, state) {
            if (state is PostLoading) {
              return Center(
                child: CircularProgressIndicator(),
              );
            }
            if (state is PostLoaded) {
              return ListView.builder(
                itemBuilder: (context, index) {
                  return Card(
                    child: ListTile(
                      title: Text(state.posts[index].title!),
                      subtitle: Text(state.posts[index].body!),
                    ),
                  );
                },
              );
            }
            return Center(
              child: Text("Error"),
            );
          },
        ));
  }
}
