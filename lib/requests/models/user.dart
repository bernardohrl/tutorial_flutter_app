import 'package:my_app/requests/models/post.dart';

class User {
  final int id;
  final String name;
  final String username;
  final String email;
  List<Post> posts = [];

  User({this.name, this.id, this.username, this.email});

  factory User.fromJson(Map<String, dynamic> json) {
    // print('Fazendo User');

    return User(
      id: json['id'],
      name: json['name'],
      username: json['username'],
      email: json['email'],
    );
  }
}