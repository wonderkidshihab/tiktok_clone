class UserProfileModel {
  final String uid;
  final String email;
  final String name;
  final String bio;
  final String link;
  final String birthday;
  final String? avatarUrl;

  UserProfileModel({
    required this.uid,
    required this.email,
    required this.name,
    required this.bio,
    required this.link,
    required this.birthday,
    this.avatarUrl,
  });

  UserProfileModel.empty()
      : uid = "",
        email = "",
        name = "",
        bio = "",
        link = "",
        birthday = "",
        avatarUrl = null;

  UserProfileModel.fromJson(Map<String, dynamic> json)
      : uid = json["uid"] ?? '',
        email = json["email"] ?? '',
        name = json["name"] ?? '',
        bio = json["bio"] ?? '',
        link = json["link"] ?? '',
        birthday = json["birthday"] ?? '',
        avatarUrl = json["avatarUrl"];

  Map<String, dynamic> toJson() {
    return {
      "uid": uid,
      "email": email,
      "name": name,
      "bio": bio,
      "link": link,
      "birthday": birthday,
      "avatarUrl": avatarUrl,
    };
  }

  UserProfileModel copyWith({
    String? uid,
    String? email,
    String? name,
    String? bio,
    String? link,
    String? birthday,
    String? avatarUrl,
  }) {
    return UserProfileModel(
      uid: uid ?? this.uid,
      email: email ?? this.email,
      name: name ?? this.name,
      bio: bio ?? this.bio,
      link: link ?? this.link,
      birthday: birthday ?? this.birthday,
      avatarUrl: avatarUrl ?? this.avatarUrl,
    );
  }
}
