class AppUser {
  final String uid;
  final String email;
  final String phone;
  final String? username;
  final String? headerImageUrl;
  final String? profileImageUrl;
  final int followers;
  final int following;

  AppUser({
    required this.uid,
    required this.email,
    required this.phone,
    this.username,
    this.headerImageUrl,
    this.profileImageUrl,
    this.followers = 0,
    this.following = 0,
  });

  Map<String, dynamic> toMap() {
    return {
      'uid': uid,
      'email': email,
      'phone': phone,
      'username': username,
      'headerImageUrl': headerImageUrl,
      'profileImageUrl': profileImageUrl,
      'followers': followers,
      'following': following,
    };
  }

  factory AppUser.fromMap(Map<String, dynamic> map) {
    return AppUser(
      uid: map['uid'],
      email: map['email'],
      phone: map['phone'],
      username: map['username'],
      headerImageUrl: map['headerImageUrl'],
      profileImageUrl: map['profileImageUrl'],
      followers: map['followers'] ?? 0,
      following: map['following'] ?? 0,
    );
  }
}
