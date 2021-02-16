// ユーザーデータ
class UserResponse {
  final String user_id;

  UserResponse({
    this.user_id,
  });

  factory UserResponse.fromJson(Map<String, dynamic> json) {
    var user_data = json['data'];
    String user_id = user_data['id_str'];
    print("koko1");
    return UserResponse(
      user_id: user_id,
    );
  }
}