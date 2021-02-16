// ブロックリスト取得
class BlocksListResponse {
  final response_data;

  BlocksListResponse({
    this.response_data,
  });

  factory BlocksListResponse.fromJson(Map<String, dynamic> json) {
    print("koko2-1");
    print(json);

    var main_data = json['data'];
    print("koko2-2");
    return BlocksListResponse(
      response_data: main_data,
    );
  }
}