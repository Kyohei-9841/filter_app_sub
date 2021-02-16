// ダイレクトメッセージ送信
class DirectMessagesNewRequest {
  final String user_id;
  final String access_token;
  final String access_token_secret;
  final String send_user_id;
  final String text;

  DirectMessagesNewRequest({
    this.user_id,
    this.access_token,
    this.access_token_secret,
    this.send_user_id,
    this.text,
  });

  Map<String, dynamic> toJson() => {
    'user_id': user_id,
    'access_token': access_token,
    'access_token_secret': access_token_secret,
    'send_user_id': send_user_id,
    'text': text,
  };
}