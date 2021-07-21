import 'package:chopper/chopper.dart';
import 'package:news_app/model/news_response.dart';

part 'news_service.chopper.dart';

@ChopperApi()
abstract class NewsService extends ChopperService{

  @Get(path: 'top-headlines')
  Future<Response<NewsResponse>> getNews();

  static NewsService create(){
    final client = ChopperClient(
      baseUrl: 'https://newsapi.org/v2/',
      services: [
        _$NewsService(),
      ],
      interceptors: [HttpLoggingInterceptor()],
    );

    return _$NewsService(client);
  }
}