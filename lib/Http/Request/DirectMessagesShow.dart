// ダイレクトメッセージ個別取得
class DirectMessagesShowRequest {
  final String user_id;
  final String access_token;
  final String access_token_secret;
  final String message_id;

  DirectMessagesShowRequest({
    this.user_id,
    this.access_token,
    this.access_token_secret,
    this.message_id
  });

  Map<String, dynamic> toJson() => {
    'user_id': user_id,
    'access_token': access_token,
    'access_token_secret': access_token_secret,
    'message_id': message_id,
  };
}