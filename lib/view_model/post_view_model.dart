import 'package:fetch_post/models/post_model.dart';
import 'package:fetch_post/services/post_service.dart';
import 'package:flutter/material.dart';

class PostViewModel extends ChangeNotifier {
  PostService postService = PostService();

  List<Post>? _allPosts;
  List<Post>? get allPosts => _allPosts;

  Future<void> fetchAllPosts() async {
    var result = await postService.getPost();
    _allPosts = result;
    notifyListeners();
  }
}
