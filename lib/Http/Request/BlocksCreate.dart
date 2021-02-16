// ブロック作成
class BlocksCreateRequest {
  final String user_id;
  final String access_token;
  final String access_token_secret;
  final String block_user_id;

  BlocksCreateRequest({
    this.user_id,
    this.access_token,
    this.access_token_secret,
    this.block_user_id,
  });

  Map<String, dynamic> toJson() => {
    'user_id': user_id,
    'access_token': access_token,
    'access_token_secret': access_token_secret,
    'block_user_id': block_user_id,
  };
}