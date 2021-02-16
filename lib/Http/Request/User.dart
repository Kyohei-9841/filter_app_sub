// ユーザーデータ
class UserRequest {
  final String screen_name;
  final String access_token;
  final String access_token_secret;

  UserRequest({
    this.screen_name,
    this.access_token,
    this.access_token_secret
  });

  Map<String, dynamic> toJson() => {
    'screen_name': screen_name,
    'access_token': access_token,
    'access_token_secret': access_token_secret,
  };
}