// タイムライン取得
class MainResponse {
  final response_data;

  MainResponse({
    this.response_data,
  });

  factory MainResponse.fromJson(Map<String, dynamic> json) {
    print("koko2-1");

    var main_data = [];
    main_data = json['data'];
    print("koko2-2");
    return MainResponse(
      response_data: main_data,
    );
  }
}