// 検索結果
class SearchRequest {
  final String user_id;
  final String access_token;
  final String access_token_secret;
  final String search_word;

  SearchRequest({
    this.user_id,
    this.access_token,
    this.access_token_secret,
    this.search_word
  });

  Map<String, dynamic> toJson() => {
    'user_id': user_id,
    'access_token': access_token,
    'access_token_secret': access_token_secret,
    'search_word': search_word,
  };
}