
// news_viewmodel.dart
import 'package:flutter/material.dart';
import '../core/api_service.dart';
import '../models/news_article.dart';

class NewsViewModel extends ChangeNotifier {
  List<NewsArticle> _articles = [];
  bool _isLoading = false;

  List<NewsArticle> get articles => _articles;
  bool get isLoading => _isLoading;

  Future<void> fetchNews() async {
    _isLoading = true;
    notifyListeners();
    try {
      _articles = await ApiService().fetchNews();
    } catch (e) {
      print('Error fetching news: $e');
      _articles = []; // Clear articles on error
    } finally {
      _isLoading = false;
      notifyListeners();
    }
  }
}