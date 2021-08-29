import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
     
        primarySwatch: Colors.blue,
      ),
      home: MyHomePage(),
    );
  }
}

class MyHomePage extends StatefulWidget {
  
  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {

  Future getPost()async{
      var response = await http.get(Uri.https('jsonplaceholder.typicode.com', 'posts'));
      var jsonData = jsonDecode(response.body);
      List<Post> posts = [];
      for (var p in jsonData){
        Post post = Post (p['title'], p['body']);
        posts.add(post);
      }
      print(posts.length);
      return posts;
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Post result"),),
        body: Center(child: ElevatedButton(onPressed: () {getPost(); },
        child: Text("Check Post"),),),
    );
  }
}

class Post{
  final String title, body;

  Post(this.title, this.body);
}
