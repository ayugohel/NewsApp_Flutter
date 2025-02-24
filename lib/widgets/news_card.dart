
// news_card.dart
import 'package:flutter/material.dart';
import 'package:news_app_flutter/models/news_article.dart';
import 'package:news_app_flutter/views/news_detail_screen.dart';

class NewsCard extends StatelessWidget {
  final NewsArticle article;

  const NewsCard({super.key, required this.article});

  @override
  Widget build(BuildContext context) {
    return Card(
      margin: EdgeInsets.all(8.0),
      child: ListTile(
        title: Text(article.title),
        subtitle: Text(article.source),
        onTap: () => Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => NewsDetailScreen(article: article,),
          ),
        ),
      ),
    );
  }
}
