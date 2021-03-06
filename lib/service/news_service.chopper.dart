// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'news_service.dart';

// **************************************************************************
// ChopperGenerator
// **************************************************************************

// ignore_for_file: always_put_control_body_on_new_line, always_specify_types, prefer_const_declarations
class _$NewsService extends NewsService {
  _$NewsService([ChopperClient? client]) {
    if (client == null) return;
    this.client = client;
  }

  @override
  final definitionType = NewsService;

  @override
  Future<Response<NewsModel>> getNews(String apiKey) {
    final $url = 'top-headlines?country=id&apiKey=$apiKey';
    final $request = Request('GET', $url, client.baseUrl);
    return client.send<NewsModel, NewsModel>($request);
  }

  @override
  Future<Response<NewsModel>> getNewsByCategory(
      String category, String apiKey) {
    final $url = 'top-headlines?country=id&category=$category&apiKey=$apiKey';
    final $request = Request('GET', $url, client.baseUrl);
    return client.send<NewsModel, NewsModel>($request);
  }

  @override
  Future<Response<NewsModel>> getNewsBySearch(
      String searchText, String apiKey) {
    final $url = 'top-headlines?country=id&q=$searchText&apiKey=$apiKey';
    final $request = Request('GET', $url, client.baseUrl);
    return client.send<NewsModel, NewsModel>($request);
  }
}
