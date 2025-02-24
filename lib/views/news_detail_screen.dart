
// news_detail_screen.dart

import 'package:flutter/material.dart';
import 'package:news_app_flutter/models/news_article.dart';

class NewsDetailScreen extends StatelessWidget {
 final NewsArticle article;

 const NewsDetailScreen({super.key, required this.article});

 @override
 Widget build(BuildContext context) {
   return Scaffold(
     appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
        title: Text('Article'),
      ),
     body: Padding(
       padding: const EdgeInsets.all(16.0),
       child: Column(
         crossAxisAlignment: CrossAxisAlignment.start,
         children: [
           Text(article.title, style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold)),
           SizedBox(height: 10),
           Text(article.description),
         ],
       ),
     ),
   );
 }
}