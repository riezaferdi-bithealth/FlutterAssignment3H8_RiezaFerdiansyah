class ListAlbumDetail {
  int? albumId;
  int? id;
  String? title;
  String? url;
  String? thumbnailUrl;

  ListAlbumDetail({
    this.albumId,
    this.id,
    this.title,
    this.url,
    this.thumbnailUrl,
  });

  factory ListAlbumDetail.fromJson(Map<String, dynamic> json) =>
      ListAlbumDetail(
        albumId: json["albumId"],
        id: json["id"],
        title: json["title"],
        url: json["url"],
        thumbnailUrl: json["thumbnailUrl"],
      );
}
