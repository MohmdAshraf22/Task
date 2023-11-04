class UserModel {
  final String userName;
  final int userId;
  UserModel({
    required this.userName,
    required this.userId,
  });
  static UserModel fromJson(Map<String, dynamic> json) {
    return UserModel(
      userName: json['name'],
      userId: json['id'],
    );
  }
}
