import 'package:hive/hive.dart';
import 'package:news_app/models/source_model.dart';

part 'article_model.g.dart';

@HiveType(typeId: 0)
class ArticleModel extends HiveObject {
  ArticleModel({this.source, this.author, this.title, this.description, this.url, this.urlToImage, this.publishedAt, this.content, this.isBookmarked = false});

  String? author, description, urlToImage, content;
  String? title, url, publishedAt;
  SourceModel? source;
  bool isBookmarked;

  Map<String, dynamic> toJson() {
    return {
      'author': author,
      'description': description,
      'urlToImage': urlToImage,
      'content': content,
      'title': title,
      'url': url,
      'publishedAt': publishedAt,
      'source': source,
    };
  }

  factory ArticleModel.fromJson(Map<String, dynamic> json) => ArticleModel(
        source: SourceModel.fromJson(json['source'] as Map<String, dynamic>),
        author: json['author'],
        title: json['title'],
        description: json['description'],
        url: json['url'],
        urlToImage: json['urlToImage'],
        publishedAt: json['publishedAt'],
        content: json['content'],
      );
}
