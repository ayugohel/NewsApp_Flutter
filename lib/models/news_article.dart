
// news_article.dart

class NewsArticle {
  final String title;
  final String description;
  final String url;
  final String source;
  final String publishedAt;

  NewsArticle({required this.title, required this.description, required this.url, required this.source, required this.publishedAt});

  factory NewsArticle.fromJson(Map<String, dynamic> json) {
    return NewsArticle(
      title: json['title'] ?? '',
      description: json['description'] ?? '',
      url: json['url'] ?? '',
      source: json['source']['name'] ?? '',
      publishedAt: json['publishedAt'] ?? '',
    );
  }
}