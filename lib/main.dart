import 'package:fetch_post/ui/home_page.dart';
import 'package:fetch_post/view_model/post_view_model.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (context) => PostViewModel(),
      child: MaterialApp(
        title: 'Flutter Demo',
        theme: ThemeData(
            primarySwatch: Colors.blue,
            primaryColor: Colors.pink,
            textTheme:
                TextTheme(bodyText1: TextStyle(fontWeight: FontWeight.bold))),
        home: MyHomePage(),
      ),
    );
  }
}
