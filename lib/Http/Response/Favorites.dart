// いいね
class FavoritesResponse {
  final response_data;

  FavoritesResponse({
    this.response_data,
  });

  factory FavoritesResponse.fromJson(Map<String, dynamic> json) {
    print("koko2-1");
    print(json);

    var main_data = json['data'];
    print("koko2-2");
    return FavoritesResponse(
      response_data: main_data,
    );
  }
}