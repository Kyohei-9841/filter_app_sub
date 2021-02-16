// 検索結果
class SearchResponse {
  final response_data;

  SearchResponse({
    this.response_data,
  });

  factory SearchResponse.fromJson(Map<String, dynamic> json) {
    print("koko2-1");

    var main_data = [];
    main_data = json['data'];
    print("koko2-2");
    return SearchResponse(
      response_data: main_data,
    );
  }
}