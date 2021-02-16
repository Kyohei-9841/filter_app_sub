// ダイレクトメッセージ送信
class DirectMessagesNewResponse {
  final response_data;

  DirectMessagesNewResponse({
    this.response_data,
  });

  factory DirectMessagesNewResponse.fromJson(Map<String, dynamic> json) {
    print("koko2-1");
    print(json);

    var main_data = json['data'];
    print("koko2-2");
    return DirectMessagesNewResponse(
      response_data: main_data,
    );
  }
}