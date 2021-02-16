// ブロックID取得
class BlocksIdsResponse {
  final response_data;

  BlocksIdsResponse({
    this.response_data,
  });

  factory BlocksIdsResponse.fromJson(Map<String, dynamic> json) {
    print("koko2-1");
    print(json);

    var main_data = json['data'];
    print("koko2-2");
    return BlocksIdsResponse(
      response_data: main_data,
    );
  }
}