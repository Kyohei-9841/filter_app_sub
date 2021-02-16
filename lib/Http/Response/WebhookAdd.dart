// ブロックID取得
class WebhookAddResponse {
  final response_data;

  WebhookAddResponse({
    this.response_data,
  });

  factory WebhookAddResponse.fromJson(Map<String, dynamic> json) {
    print("koko2-1");
    print(json);

    var main_data = json['data'];
    print("koko2-2");
    return WebhookAddResponse(
      response_data: main_data,
    );
  }
}