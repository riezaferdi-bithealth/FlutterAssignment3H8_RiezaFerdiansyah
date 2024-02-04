class ListPosts {
  int? userId;
  int? id;
  String? title;
  String? body;

  ListPosts({
    this.userId,
    this.id,
    this.title,
    this.body,
  });

  factory ListPosts.fromJson(Map<String, dynamic> json) => ListPosts(
        userId: json["userId"],
        id: json["id"],
        title: json["title"],
        body: json["body"],
      );
}
