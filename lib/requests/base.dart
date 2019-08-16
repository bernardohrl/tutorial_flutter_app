import 'package:flutter/material.dart';
import 'package:my_app/requests/models/post.dart';
import 'package:my_app/requests/models/user.dart';
import 'package:my_app/requests/request.dart';

class Startpage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Começo'),
      ),
      body: Center(
        child: RaisedButton(
            child: Text('Requestei!'),
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => Base()),
              );
            }),
      ),
    );
  }
}

class Base extends StatefulWidget {
  Base();

  @override
  _BaseState createState() => _BaseState();
}

class _BaseState extends State<Base> {
  Future<Post> post;
  Future<User> user;

  @override
  void initState() {
    super.initState();
    user = fetchUser();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text('Base'),
          actions: <Widget>[],
        ),
        body: FutureBuilder(
          future: user,
          builder: (context, snapshot) {
            if (snapshot.hasData) {
              return displayUser(snapshot.data);
            } else if (snapshot.hasError) {
              return Text("${snapshot.error}");
            }

            // By default, show a loading spinner.
            return CircularProgressIndicator();
          },
        ));
  }

  Widget text(String text) {
    return Center(child: Text(text));
  }

  Widget displayUser(User user) {
    return Column(children: [
      Container(
        color: Colors.white,
        child: text(user.name)
      ),
      Container(
        color: Colors.blue,
        child: text(user.posts[0].title)
      ),
      Container(
        color: Colors.white,
        child: text(user.posts[1].title)
      ),
    ]);
  }
}
