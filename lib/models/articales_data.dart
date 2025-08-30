import 'package:news/models/source_data.dart';

class NewsData {
  final String status;
  final int totalResults;
  final List<ArticlesData> articales;

  NewsData({
    required this.status,
    required this.totalResults,
    required this.articales,
  });

  factory NewsData.fromJosn(Map<String, dynamic> json) => NewsData(
    status: json['status'],
    totalResults: json["totalResults"],
    articales: (json["articales"] as List).map((e) {
      return ArticlesData.fromJosn(json);
    }).toList(),
  );
}

class ArticlesData {
  final SourceData source;
  final String? author;
  final String title;
  final String description;
  final String url;
  final String urlToImage;
  final String publishedAt;
  final String? content;

  ArticlesData({
    required this.source,
    this.author,
    required this.title,
    required this.description,
    required this.url,
    required this.urlToImage,
    required this.publishedAt,
    this.content,
  });

  factory ArticlesData.fromJosn(Map<String, dynamic> josn) => ArticlesData(
    source: SourceData.fromJson(josn['source']),
    author: josn['author'],
    title: josn['title'],
    description: josn["description"],
    url: josn["url"],
    urlToImage: josn["urlToImage"],
    publishedAt: josn["publishedAt"],
    content: josn["content"],
  );
}
