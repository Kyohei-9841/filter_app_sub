// タイムライン取得(続き)
class MainAdditionalRequest {
  final String user_id;
  final String access_token;
  final String access_token_secret;
  final String max_id;

  MainAdditionalRequest({
    this.user_id,
    this.access_token,
    this.access_token_secret,
    this.max_id
  });

  Map<String, dynamic> toJson() => {
    'user_id': user_id,
    'access_token': access_token,
    'access_token_secret': access_token_secret,
    'max_id': max_id,
  };
}