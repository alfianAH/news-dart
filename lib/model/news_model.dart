import 'package:json_annotation/json_annotation.dart';

part 'news_model.g.dart';

@JsonSerializable()
class NewsModel {
  @JsonKey(name: 'status')
  String? status;

  @JsonKey(name: 'totalResults')
  int? totalResults;

  @JsonKey(name: 'articles')
  List<Articles>? articles;

  NewsModel({
      this.status, 
      this.totalResults, 
      this.articles});

  NewsModel.fromJson(dynamic json) {
    status = json["status"];
    totalResults = json["totalResults"];
    if (json["articles"] != null) {
      articles = [];
      json["articles"].forEach((v) {
        articles?.add(Articles.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    var map = <String, dynamic>{};
    map["status"] = status;
    map["totalResults"] = totalResults;
    if (articles != null) {
      map["articles"] = articles?.map((v) => v.toJson()).toList();
    }
    return map;
  }

}

@JsonSerializable()
class Articles {
  @JsonKey(name: 'source')
  Source? source;

  @JsonKey(name: 'author')
  String? author;

  @JsonKey(name: 'title')
  String? title;

  @JsonKey(name: 'description')
  String? description;

  @JsonKey(name: 'url')
  String? url;

  @JsonKey(name: 'urlToImage')
  String? urlToImage;

  @JsonKey(name: 'publishedAt')
  String? publishedAt;

  @JsonKey(name: 'content')
  String? content;

  Articles({
      this.source, 
      this.author, 
      this.title, 
      this.description, 
      this.url, 
      this.urlToImage, 
      this.publishedAt, 
      this.content});

  Articles.fromJson(dynamic json) {
    source = json["source"] != null ? Source.fromJson(json["source"]) : null;
    author = json["author"];
    title = json["title"];
    description = json["description"];
    url = json["url"];
    urlToImage = json["urlToImage"];
    publishedAt = json["publishedAt"];
    content = json["content"];
  }

  Map<String, dynamic> toJson() {
    var map = <String, dynamic>{};
    if (source != null) {
      map["source"] = source?.toJson();
    }
    map["author"] = author;
    map["title"] = title;
    map["description"] = description;
    map["url"] = url;
    map["urlToImage"] = urlToImage;
    map["publishedAt"] = publishedAt;
    map["content"] = content;
    return map;
  }

}

@JsonSerializable()
class Source {
  @JsonKey(name: 'id')
  dynamic? id;

  @JsonKey(name: 'name')
  String? name;

  Source({
      this.id, 
      this.name});

  Source.fromJson(dynamic json) {
    id = json["id"];
    name = json["name"];
  }

  Map<String, dynamic> toJson() {
    var map = <String, dynamic>{};
    map["id"] = id;
    map["name"] = name;
    return map;
  }

}