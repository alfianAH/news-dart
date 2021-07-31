import 'package:news_app/utils/api_key/api_key.dart';
import 'package:news_app/utils/api_key/api_key_loader.dart';

final String _apiKeyPath = "assets/key.json";
String apiKey = '';

Future<void> loadApiKey() async {
  ApiKey apiKeyLoader = await ApiKeyLoader(apiKeyPath: _apiKeyPath).load();
  apiKey = apiKeyLoader.apiKey;
  print('load: $apiKey');
}