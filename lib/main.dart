
import 'package:flutter/material.dart';
import 'package:news_app_flutter/viewmodels/news_viewmodel.dart';
import 'package:news_app_flutter/views/news_list_screen.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (_) => NewsViewModel()),
      ],
      child: MaterialApp(
        title: 'NewsApp',
        theme: ThemeData(
          colorScheme: ColorScheme.fromSeed(brightness: Brightness.dark, seedColor: Colors.blue),
        ),
        home: NewsListScreen(),
      ),
    );
  }
}