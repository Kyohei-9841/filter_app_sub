// ツイート
class RetweetRequest {
  final String user_id;
  final String access_token;
  final String access_token_secret;
  final String screen_name;
  final String id_str;
  final String text;
  final String in_reply_to_status_id;

  RetweetRequest({
    this.user_id,
    this.access_token,
    this.access_token_secret,
    this.screen_name,
    this.id_str,
    this.text,
    this.in_reply_to_status_id,
  });

  Map<String, dynamic> toJson() => {
    'user_id': user_id,
    'access_token': access_token,
    'access_token_secret': access_token_secret,
    'screen_name': screen_name,
    'id_str': id_str,
    'text': text,
    'in_reply_to_status_id': in_reply_to_status_id,
  };
}