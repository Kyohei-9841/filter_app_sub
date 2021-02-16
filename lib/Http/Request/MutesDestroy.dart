// ミュート解除
class MutesDestroyRequest {
  final String user_id;
  final String access_token;
  final String access_token_secret;
  final String release_user_id;

  MutesDestroyRequest({
    this.user_id,
    this.access_token,
    this.access_token_secret,
    this.release_user_id,
  });

  Map<String, dynamic> toJson() => {
    'user_id': user_id,
    'access_token': access_token,
    'access_token_secret': access_token_secret,
    'release_user_id': release_user_id,
  };
}