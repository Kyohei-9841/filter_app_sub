// ミュートリスト取得
class MutesListResponse {
  final response_data;

  MutesListResponse({
    this.response_data,
  });

  factory MutesListResponse.fromJson(Map<String, dynamic> json) {
    print("koko2-1");
    print(json);

    var main_data = json['data'];
    print("koko2-2");
    return MutesListResponse(
      response_data: main_data,
    );
  }
}