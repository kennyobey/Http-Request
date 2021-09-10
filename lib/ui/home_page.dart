import 'package:fetch_post/view_model/post_view_model.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class MyHomePage extends StatefulWidget {
  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  PostViewModel postViewModel = PostViewModel();
  @override
  void initState() {
    super.initState();
    fetchPost();
  }

  Future<void> fetchPost() async {
    var provider = Provider.of<PostViewModel>(context, listen: false);
    await provider.fetchAllPosts();
  }

  @override
  Widget build(BuildContext context) {
    var snapshot = Provider.of<PostViewModel>(context);
    return Scaffold(
        appBar: AppBar(
          title: Text("Post result"),
        ),
        body: ListView.builder(
            itemCount: snapshot.allPosts?.length,
            itemBuilder: (context, i) {
              return Card(
                child: ListTile(
                  title: Text(
                    snapshot.allPosts?[i].title ?? "",
                    style: Theme.of(context).textTheme.bodyText1,
                  ),
                  subtitle: Text(snapshot.allPosts?[i].body ?? ""),
                ),
              );
            }));
  }
}
