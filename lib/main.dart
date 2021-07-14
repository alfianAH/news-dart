import 'package:flutter/material.dart';
import 'package:news_app/ui/home_screen.dart';
import 'package:news_app/ui/values/colors/news_colors.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Berita Indonesia',
      theme: ThemeData(
        appBarTheme: AppBarTheme(
          backgroundColor: NewsColors.appBar,
        ),
        backgroundColor: NewsColors.bodyDark,
        fontFamily: 'Kanit'
      ),
      home: HomeScreen(),
    );
  }
}

