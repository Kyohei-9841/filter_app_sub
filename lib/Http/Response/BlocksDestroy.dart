// ブロック解除
class BlocksDestroyResponse {
  final response_data;

  BlocksDestroyResponse({
    this.response_data,
  });

  factory BlocksDestroyResponse.fromJson(Map<String, dynamic> json) {
    print("koko2-1");
    print(json);

    var main_data = json['data'];
    print("koko2-2");
    return BlocksDestroyResponse(
      response_data: main_data,
    );
  }
}