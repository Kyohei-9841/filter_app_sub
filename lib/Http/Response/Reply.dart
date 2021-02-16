// コメント取得
class ReplyResponse {
  final response_data;

  ReplyResponse({
    this.response_data,
  });

  factory ReplyResponse.fromJson(Map<String, dynamic> json) {
    print("koko2-1");

    var main_data = [];
    main_data = json['data']['data'];
    print("koko2-2");
    return ReplyResponse(
      response_data: main_data,
    );
  }
}