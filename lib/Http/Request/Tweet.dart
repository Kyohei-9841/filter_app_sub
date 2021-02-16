// ツイート
class TweetRequest {
  final String user_id;
  final String access_token;
  final String access_token_secret;
  final String text;

  TweetRequest({
    this.user_id,
    this.access_token,
    this.access_token_secret,
    this.text,
  });

  Map<String, dynamic> toJson() => {
    'user_id': user_id,
    'access_token': access_token,
    'access_token_secret': access_token_secret,
    'text': text,
  };
}