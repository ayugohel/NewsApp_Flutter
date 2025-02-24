
// news_card.dart

import 'package:flutter/material.dart';
import 'package:news_app_flutter/models/news_article.dart';
import 'package:news_app_flutter/views/news_detail_screen.dart';
import 'package:intl/intl.dart';

class NewsCard extends StatelessWidget {
  final NewsArticle article;

  const NewsCard({super.key, required this.article});

  @override
  Widget build(BuildContext context) {

     // Format the published date
    final DateFormat formatter = DateFormat('yyyy-MM-dd HH:mm');
    final String formattedDate = formatter.format(DateTime.parse(article.publishedAt));

    return InkWell(
      onTap: () => Navigator.push(
        context,
        MaterialPageRoute(
          builder: (context) => NewsDetailScreen(article: article),
        ),
      ),
      child: Card(
        margin: EdgeInsets.all(8.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            article.urlToImage.isNotEmpty
                ? Image.network(
                    article.urlToImage,
                    fit: BoxFit.cover,
                    width: double.infinity,
                    height: 200,
                    errorBuilder: (context, error, stackTrace) {
                      return SizedBox(
                        height: 200,
                        child: Center(child: Text('Failed to load image')),
                      );
                    },
                  )
                : SizedBox(height: 0),
            Padding(
              padding: EdgeInsets.all(8.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    article.title,
                    style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                  ),
                  SizedBox(height: 5),
                  Text(
                    'Source: ${article.source}',
                    style: TextStyle(fontWeight: FontWeight.bold, color: Colors.blueAccent),
                  ),
                  SizedBox(height: 5),
                  Text(
                    'Published at: $formattedDate',
                    style: TextStyle(fontSize: 12, fontWeight: FontWeight.bold, color: Colors.blueGrey),
                  ),
                  // SizedBox(height: 5),
                  // Text(
                  //   article.description,
                  //   maxLines: 2,
                  //   overflow: TextOverflow.ellipsis,
                  // ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}