// 引用ツイートの解除
class RetweetDestroyRequest {
  final String user_id;
  final String access_token;
  final String access_token_secret;
  final String id_str;

  RetweetDestroyRequest({
    this.user_id,
    this.access_token,
    this.access_token_secret,
    this.id_str,
  });

  Map<String, dynamic> toJson() => {
    'user_id': user_id,
    'access_token': access_token,
    'access_token_secret': access_token_secret,
    'id_str': id_str,
  };
}