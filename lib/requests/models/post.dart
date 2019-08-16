class Post {
  final int userId;
  final int id;
  final String title;
  final String body;

  Post({this.userId, this.id, this.title, this.body});

  factory Post.fromJson(Map<String, dynamic> json) {
    return Post(
      userId: json['userId'],
      id: json['id'],
      title: json['title'],
      body: json['body'],
    );
  }

  static List<Post> getPostList(List<dynamic> list) {
    List<Post> posts = new List<Post>();

    list.forEach((post) => posts.add(Post.fromJson(post)));

    return posts;
  }
}