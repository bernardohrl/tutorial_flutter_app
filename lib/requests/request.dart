import 'dart:convert';

import 'package:http/http.dart';
// import 'package:my_app/requests/models/comments.dart';
import 'package:my_app/requests/models/post.dart';
import 'package:my_app/requests/models/user.dart';

String baseUrl = 'https://jsonplaceholder.typicode.com/';

Future<User> fetchUser() async {
  User user;
  Response userResponse = await get(baseUrl + 'users/1');

  userResponse.statusCode == 200 ? 
      user = User.fromJson(json.decode(userResponse.body)) :
      throw Exception('FAILED TO LOAD USERS');


  // Get User's Posts
  Response postsResponse =
      await get(baseUrl + 'posts?userId=' + user.id.toString());

  postsResponse.statusCode == 200 ? 
    user.posts = Post.getPostList(json.decode(postsResponse.body)) :
    throw Exception('FAILED TO LOAD POSTS');

  return user;
}
