// ミュート解除
class MutesDestroyResponse {
  final response_data;

  MutesDestroyResponse({
    this.response_data,
  });

  factory MutesDestroyResponse.fromJson(Map<String, dynamic> json) {
    print("koko2-1");
    print(json);

    var main_data = json['data'];
    print("koko2-2");
    return MutesDestroyResponse(
      response_data: main_data,
    );
  }
}