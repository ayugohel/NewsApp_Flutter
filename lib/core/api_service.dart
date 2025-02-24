
// api_service.dart
import 'package:dio/dio.dart';
import '../models/news_article.dart';
import '../utils/constants.dart';

class ApiService {
  final Dio _dio = Dio();

  Future<List<NewsArticle>> fetchNews() async {
    final response = await _dio.get('${Constants.newsApiUrl}&apiKey=${Constants.apiKey}');
    if (response.statusCode == 200) {
      return (response.data['articles'] as List).map((article) => NewsArticle.fromJson(article)).toList();
    } else {
      throw Exception('Failed to load news');
    }
  }
}