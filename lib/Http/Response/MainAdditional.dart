// タイムライン取得(続き)
class MainAdditionalResponse {
  final response_data;

  MainAdditionalResponse({
    this.response_data,
  });

  factory MainAdditionalResponse.fromJson(Map<String, dynamic> json) {
    print("koko2-1");

    var main_data = [];
    main_data = json['data'];
    print("koko2-2");
    return MainAdditionalResponse(
      response_data: main_data,
    );
  }
}