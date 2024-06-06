class UserInfo {
  int id;
  String name;
  AvatarUrls? avatarUrls;

  UserInfo({required this.id, required this.name, this.avatarUrls});

  factory UserInfo.fromJson(Map<String, dynamic> json) {
    return UserInfo(
      id: json['id'] ?? 0,
      name: json['name'] ?? '',
      avatarUrls: json['avatar_urls'] != null ? AvatarUrls.fromJson(json['avatar_urls']) : null,
    );
  }
}

class AvatarUrls {
  String s24;
  String s48;
  String s96;

  AvatarUrls({required this.s24, required this.s48, required this.s96});

  factory AvatarUrls.fromJson(Map<String, dynamic> json) {
    return AvatarUrls(
      s24: json['24'] ?? '',
      s48: json['48'] ?? '',
      s96: json['96'] ?? '',
    );
  }
}
