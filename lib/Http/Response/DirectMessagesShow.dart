// ダイレクトメッセージ個別取得
class DirectMessagesShowResponse {
  final response_data;

  DirectMessagesShowResponse({
    this.response_data,
  });

  factory DirectMessagesShowResponse.fromJson(Map<String, dynamic> json) {
    print("koko2-1");
    print(json);

    var main_data = json['data'];
    print("koko2-2");
    return DirectMessagesShowResponse(
      response_data: main_data,
    );
  }
}