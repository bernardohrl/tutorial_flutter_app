class Comment {
  final int postId;
  final int id;
  final String name;
  final String body;

  Comment({this.postId, this.id, this.name, this.body});

  factory Comment.fromJson(Map<String, dynamic> json) {
    print('Veio serializar Comment');

    return Comment(
      postId: json['postId'],
      id: json['id'],
      name: json['name'],
      body: json['body'],
    );
  }

  static Comment jsonToComment(data) {
    return Comment(
      id: data['id'],
      postId: data['postId'],
      name: data['name'],
      body: data['body'],
    );
  }

  static List<Comment> jsonToComments(data) {
    print('Fazendo lista de comments');

    List<Comment> comments = new List<Comment>();
    data.forEach((commentJSON) => comments.add(jsonToComment(commentJSON)));

    return comments;
  }
}