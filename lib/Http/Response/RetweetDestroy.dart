// リツイート解除
class RetweetDestroyResponse {
  final response_data;

  RetweetDestroyResponse({
    this.response_data,
  });

  factory RetweetDestroyResponse.fromJson(Map<String, dynamic> json) {
    print("koko2-1");
    print(json);

    var main_data = json['data'];
    print("koko2-2");
    return RetweetDestroyResponse(
      response_data: main_data,
    );
  }
}