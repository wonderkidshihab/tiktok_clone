class VideoModel {
  final String title;
  final String description;
  final String fileUrl;
  final String thumbnailUrl;
  final String creatorUid;
  final String creator;
  final String id;
  final int likes;
  final int comments;
  final int createdAt;
  final String? creatorAvatar;

  VideoModel({
    required this.id,
    required this.title,
    required this.description,
    required this.fileUrl,
    required this.thumbnailUrl,
    required this.creatorUid,
    required this.likes,
    required this.comments,
    required this.createdAt,
    required this.creator,
    this.creatorAvatar,
  });

  factory VideoModel.fromJson({
    required Map<String, dynamic> json,
    required String videoId,
  }) {
    return VideoModel(
      title: json["title"],
      description: json["description"],
      fileUrl: json["fileUrl"],
      thumbnailUrl: json["thumbnailUrl"],
      creatorUid: json["creatorUid"],
      likes: json["likes"],
      comments: json["comments"],
      createdAt: json["createdAt"],
      id: videoId,
      creator: json["creator"],
      creatorAvatar: json["creatorAvatar"],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      "title": title,
      "description": description,
      "fileUrl": fileUrl,
      "thumbnailUrl": thumbnailUrl,
      "creatorUid": creatorUid,
      "likes": likes,
      "comments": comments,
      "createdAt": createdAt,
      "creator": creator,
      "id": id,
    };
  }
}
