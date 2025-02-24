
// news_list_screen.dart
import 'package:flutter/material.dart';
import 'package:news_app_flutter/viewmodels/news_viewmodel.dart';
import 'package:news_app_flutter/widgets/news_card.dart';
import 'package:provider/provider.dart';

class NewsListScreen extends StatefulWidget {
  const NewsListScreen({super.key});

  @override
  State<NewsListScreen> createState() => _NewsListScreenState();
}

class _NewsListScreenState extends State<NewsListScreen> {
  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((_) {
      Provider.of<NewsViewModel>(context, listen: false).fetchNews();
    });
  }

  @override
  Widget build(BuildContext context) {
    final viewModel = Provider.of<NewsViewModel>(context);

    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
        title: Text('Latest News'),
      ),
      body: viewModel.isLoading
          ? Center(child: CircularProgressIndicator())
          : viewModel.articles.isEmpty
              ? Center(child: Text('No news available'))
              : ListView.builder(
                  itemCount: viewModel.articles.length,
                  itemBuilder: (context, index) {
                    return NewsCard(article: viewModel.articles[index]);
                  },
                ),
    );
  }
}