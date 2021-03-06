// ブロックID取得
class BlocksIdsRequest {
  final String user_id;
  final String access_token;
  final String access_token_secret;

  BlocksIdsRequest({
    this.user_id,
    this.access_token,
    this.access_token_secret,
  });

  Map<String, dynamic> toJson() => {
    'user_id': user_id,
    'access_token': access_token,
    'access_token_secret': access_token_secret,
  };
}