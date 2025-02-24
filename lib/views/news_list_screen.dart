
// news_list_screen.dart
import 'package:flutter/material.dart';
import 'package:news_app_flutter/widgets/news_card.dart';

class NewsListScreen extends StatefulWidget {
  const NewsListScreen({super.key});

  @override
  State<NewsListScreen> createState() => _NewsListScreenState();
}

class _NewsListScreenState extends State<NewsListScreen> {
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {

    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
        title: Text('Latest News'),
      ),
      body: ListView.builder(
              itemCount: 10,
              itemBuilder: (context, index) {
                return NewsCard();
              },
            )
    );
  }
}