import 'dart:convert';

import 'package:flutter/services.dart';
import 'package:news_app/utils/api_key/api_key.dart';

class ApiKeyLoader{
  final String apiKeyPath;

  ApiKeyLoader({this.apiKeyPath = ""});

  Future<ApiKey> load(){
    return rootBundle.loadStructuredData(apiKeyPath, (jsonStr) async {
      final apiKey = ApiKey.fromJson(jsonDecode(jsonStr));
      return apiKey;
    });
  }
}