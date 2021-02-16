// ツイート
class TweetResponse {
  final response_data;

  TweetResponse({
    this.response_data,
  });

  factory TweetResponse.fromJson(Map<String, dynamic> json) {
    print("koko2-1");
    print(json);

    var main_data = json['data'];
    print("koko2-2");
    return TweetResponse(
      response_data: main_data,
    );
  }
}