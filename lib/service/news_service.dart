import 'package:chopper/chopper.dart';
import 'package:news_app/model/news_model.dart';
import 'package:news_app/utils/model_converter.dart';

part 'news_service.chopper.dart';

@ChopperApi()
abstract class NewsService extends ChopperService{

  @Get(path: 'top-headlines?country=id&apiKey={apiKey}')
  Future<Response<NewsModel>> getNews(@Path() String apiKey);

  static NewsService create(){
    final client = ChopperClient(
      baseUrl: 'https://newsapi.org/v2/',
      services: [
        _$NewsService(),
      ],
      interceptors: [HttpLoggingInterceptor()],
      converter: ModelConverter(),
      errorConverter: JsonConverter(),
    );

    return _$NewsService(client);
  }
}