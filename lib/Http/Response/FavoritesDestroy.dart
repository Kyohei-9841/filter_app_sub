// リツイート解除
class FavoritesDestroyResponse {
  final response_data;

  FavoritesDestroyResponse({
    this.response_data,
  });

  factory FavoritesDestroyResponse.fromJson(Map<String, dynamic> json) {
    print("koko2-1");
    print(json);

    var main_data = json['data'];
    print("koko2-2");
    return FavoritesDestroyResponse(
      response_data: main_data,
    );
  }
}