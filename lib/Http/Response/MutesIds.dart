// ミュートID取得
class MutesIdsResponse {
  final response_data;

  MutesIdsResponse({
    this.response_data,
  });

  factory MutesIdsResponse.fromJson(Map<String, dynamic> json) {
    print("koko2-1");
    print(json);

    var main_data = json['data'];
    print("koko2-2");
    return MutesIdsResponse(
      response_data: main_data,
    );
  }
}