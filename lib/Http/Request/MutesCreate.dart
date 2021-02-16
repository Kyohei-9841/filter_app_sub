// ミュート作成
class MutesCreateRequest {
  final String user_id;
  final String access_token;
  final String access_token_secret;
  final String mute_user_id;

  MutesCreateRequest({
    this.user_id,
    this.access_token,
    this.access_token_secret,
    this.mute_user_id,
  });

  Map<String, dynamic> toJson() => {
    'user_id': user_id,
    'access_token': access_token,
    'access_token_secret': access_token_secret,
    'mute_user_id': mute_user_id,
  };
}