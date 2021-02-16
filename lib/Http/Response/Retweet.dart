// ツイート
class RetweetResponse {
  final response_data;

  RetweetResponse({
    this.response_data,
  });

  factory RetweetResponse.fromJson(Map<String, dynamic> json) {
    print("koko2-1");
    print(json);

    var main_data = json['data'];
    print("koko2-2");
    return RetweetResponse(
      response_data: main_data,
    );
  }
}