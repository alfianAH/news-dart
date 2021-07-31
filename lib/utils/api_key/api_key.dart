class ApiKey {
  String apiKey;

  ApiKey({
      this.apiKey = ""
  });

  factory ApiKey.fromJson(Map<String, dynamic> json) {
    return ApiKey(apiKey: json["api_key"]);
  }
}