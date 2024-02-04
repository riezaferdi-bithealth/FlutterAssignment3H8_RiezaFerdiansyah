class ListAlbum {
  int? userId;
  int? id;
  String? title;

  ListAlbum({
    this.userId,
    this.id,
    this.title,
  });

  factory ListAlbum.fromJson(Map<String, dynamic> json) => ListAlbum(
        userId: json["userId"],
        id: json["id"],
        title: json["title"],
      );
}
