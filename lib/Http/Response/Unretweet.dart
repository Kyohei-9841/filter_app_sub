// リツイート解除
class UnretweetResponse {
  final response_data;

  UnretweetResponse({
    this.response_data,
  });

  factory UnretweetResponse.fromJson(Map<String, dynamic> json) {
    print("koko2-1");
    print(json);

    var main_data = json['data'];
    print("koko2-2");
    return UnretweetResponse(
      response_data: main_data,
    );
  }
}