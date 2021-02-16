// ブロック作成
class BlocksCreateResponse {
  final response_data;

  BlocksCreateResponse({
    this.response_data,
  });

  factory BlocksCreateResponse.fromJson(Map<String, dynamic> json) {
    print("koko2-1");
    print(json);

    var main_data = json['data'];
    print("koko2-2");
    return BlocksCreateResponse(
      response_data: main_data,
    );
  }
}