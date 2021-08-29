import 'package:fetch_post/models/post_model.dart';
import 'package:fetch_post/services/post_service.dart';
import 'package:flutter/material.dart';

class MyHomePage extends StatefulWidget {
  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  final PostService postService = PostService();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Post result"),
      ),
      body: FutureBuilder<List<Post>>(
        future: postService.getPost(),
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return Container(
              child: Center(
                child: Text('Loading...'),
              ),
            );
          }
          if (snapshot.hasError) {
            return Container(
              child: Center(
                child: Text('Error...'),
              ),
            );
          } else if (snapshot.hasData) {
            return ListView.builder(
                itemCount: snapshot.data!.length,
                itemBuilder: (context, i) {
                  return Card(
                    child: ListTile(
                      title: Text(snapshot.data![i].title ?? ""),
                      subtitle: Text(snapshot.data![i].body ?? ""),
                    ),
                  );
                });
          }
          return Container(
            child: Center(
              child: Text('Initial...'),
            ),
          );
        },
      ),
    );
  }
}
