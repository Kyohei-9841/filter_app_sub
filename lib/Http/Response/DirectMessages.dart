// ダイレクトメッセージ
class DirectMessagesResponse {
  final response_data;

  DirectMessagesResponse({
    this.response_data,
  });

  factory DirectMessagesResponse.fromJson(Map<String, dynamic> json) {
    print("koko2-1");
    print(json);

    var main_data = json['data'];
    print("koko2-2");
    return DirectMessagesResponse(
      response_data: main_data,
    );
  }
}