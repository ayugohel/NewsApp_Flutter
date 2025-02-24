
// news_detail_screen.dart

import 'package:flutter/material.dart';
import 'package:news_app_flutter/models/news_article.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:intl/intl.dart';

class NewsDetailScreen extends StatelessWidget {
  final NewsArticle article;

  const NewsDetailScreen({super.key, required this.article});

  @override
  Widget build(BuildContext context) {

    // Format the published date
    final DateFormat formatter = DateFormat('yyyy-MM-dd HH:mm');
    final String formattedDate = formatter.format(DateTime.parse(article.publishedAt));

    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
        title: Text('Article Details'),
      ),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            article.urlToImage.isNotEmpty
                ? Image.network(
                    article.urlToImage,
                    fit: BoxFit.cover,
                    width: double.infinity,
                    height: 300,
                    errorBuilder: (context, error, stackTrace) {
                      return SizedBox(
                        height: 300,
                        child: Center(child: Text('Failed to load image')),
                      );
                    },
                  )
                : SizedBox(height: 0),
            Padding(
              padding: EdgeInsets.all(16.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    article.title,
                    style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
                  ),
                  SizedBox(height: 10),
                  Text(
                    'Source: ${article.source}',
                    style: TextStyle(fontWeight: FontWeight.bold, color: Colors.blueAccent),
                  ),
                  SizedBox(height: 10),
                  Text(
                    'Published at: $formattedDate',
                    style: TextStyle(fontSize: 12, fontWeight: FontWeight.bold, color: Colors.blueGrey),
                  ),
                  SizedBox(height: 20),
                  Text(
                    article.description,
                    style: TextStyle(fontSize: 16),
                  ),
                  SizedBox(height: 20),
                  ElevatedButton(
                    onPressed: () async {
                      final Uri url = Uri.parse(article.url);
                      if (await canLaunchUrl(url)) {
                        await launchUrl(url);
                      } else {
                        throw 'Could not launch $url';
                      }
                    },
                    child: Text('Read More'),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}