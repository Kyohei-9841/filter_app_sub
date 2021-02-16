// ミュート作成
class MutesCreateResponse {
  final response_data;

  MutesCreateResponse({
    this.response_data,
  });

  factory MutesCreateResponse.fromJson(Map<String, dynamic> json) {
    print("koko2-1");
    print(json);

    var main_data = json['data'];
    print("koko2-2");
    return MutesCreateResponse(
      response_data: main_data,
    );
  }
}