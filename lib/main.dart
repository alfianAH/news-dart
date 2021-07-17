import 'package:flutter/material.dart';
import 'package:news_app/ui/home_screen.dart';
import 'package:news_app/ui/values/colors/news_colors.dart';
import 'package:news_app/ui/values/fonts/news_font.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Berita Indonesia',
      theme: ThemeData(
        primaryColor: NewsColors.primaryColor,
        scaffoldBackgroundColor: NewsColors.bodyDark,
        canvasColor: NewsColors.bodyDark,
        textTheme: TextTheme(
          headline1: TextStyle(
            color: NewsColors.fontLight,
            fontSize: 25,
            fontWeight: NewsFonts.semiBold,
          ),

          headline2: TextStyle(
            color: NewsColors.fontLight,
            fontSize: 30,
            fontWeight: NewsFonts.bold,
          ),

          headline3: TextStyle(
            color: NewsColors.fontDark,
            fontSize: 20,
            fontWeight: NewsFonts.bold,
          ),

          bodyText1: TextStyle(
            color: NewsColors.fontLight,
            fontSize: 20,
          ),

          bodyText2: TextStyle(
            color: NewsColors.fontDark,
            fontSize: 15,
          ),

          subtitle1: TextStyle(
            color: NewsColors.fontLight,
            fontSize: 17,
            fontWeight: NewsFonts.extraLight,
          ),

          subtitle2: TextStyle(
            color: NewsColors.linkDark,
            fontSize: 20,
            fontWeight: NewsFonts.light,
          ),
        ),
        fontFamily: 'Kanit'
      ),
      home: HomeScreen(),
    );
  }
}

