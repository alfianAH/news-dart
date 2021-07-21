import 'package:json_annotation/json_annotation.dart';

part 'news_response.g.dart';

@JsonSerializable()
class NewsResponse{
  @JsonKey(name: 'author')
  String author;

  @JsonKey(name: 'title')
  String title;

  @JsonKey(name: 'description')
  String description;

  @JsonKey(name: 'url')
  String url;

  @JsonKey(name: 'urlToImage')
  String urlToImage;

  @JsonKey(name: 'publishedAt')
  String publishedAt;

  @JsonKey(name: 'content')
  String content;

  NewsResponse({
    required this.author,
    required this.title,
    required this.description,
    required this.url,
    required this.urlToImage,
    required this.publishedAt,
    required this.content
  });

  factory NewsResponse.fromJson(Map<String, dynamic> json) => _$NewsResponseFromJson(json);

  Map<String, dynamic> toJson() => _$NewsResponseToJson(this);
}