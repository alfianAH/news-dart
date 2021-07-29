import 'package:flutter/material.dart';
import 'package:news_app/ui/values/colors/news_colors.dart';
import 'package:news_app/ui/values/fonts/news_font_size.dart';
import 'package:news_app/ui/values/fonts/news_font_weight.dart';

/// News App Themes
class NewsTheme{
  /// Dark theme data
  static ThemeData darkTheme = ThemeData(
      primaryColor: NewsColors.primaryColor,
      scaffoldBackgroundColor: NewsColors.bodyDark,
      canvasColor: NewsColors.bodyDark,
      textTheme: TextTheme(
        headline1: TextStyle(
          color: NewsColors.fontLight,
          fontSize: NewsFontSize.headline1,
          fontWeight: NewsFontWeight.semiBold,
        ),

        headline2: TextStyle(
          color: NewsColors.fontLight,
          fontSize: NewsFontSize.headline2,
          fontWeight: NewsFontWeight.bold,
        ),

        headline3: TextStyle(
          color: NewsColors.fontDark,
          fontSize: NewsFontSize.headline3,
          fontWeight: NewsFontWeight.bold,
        ),

        bodyText1: TextStyle(
          color: NewsColors.fontLight,
          fontSize: NewsFontSize.bodyText1,
          fontWeight: NewsFontWeight.regular,
        ),

        bodyText2: TextStyle(
          color: NewsColors.fontDark,
          fontSize: NewsFontSize.bodyText2,
          fontWeight: NewsFontWeight.regular,
        ),

        subtitle1: TextStyle(
          color: NewsColors.fontLight,
          fontSize: NewsFontSize.subtitle1,
          fontWeight: NewsFontWeight.extraLight,
        ),

        subtitle2: TextStyle(
          color: NewsColors.fontDark,
          fontSize: NewsFontSize.subtitle2,
          fontWeight: NewsFontWeight.extraLight,
        ),

        caption: TextStyle(
          color: NewsColors.linkDark,
          fontSize: NewsFontSize.caption,
          fontWeight: NewsFontWeight.light,
        ),
      ),
      fontFamily: 'Kanit'
  );

  /// Light theme data
  static ThemeData lightTheme = ThemeData(
      primaryColor: NewsColors.primaryColor,
      scaffoldBackgroundColor: NewsColors.bodyLight,
      canvasColor: NewsColors.bodyLight,
      textTheme: TextTheme(
        headline1: TextStyle(
          color: NewsColors.fontLight,
          fontSize: NewsFontSize.headline1,
          fontWeight: NewsFontWeight.semiBold,
        ),

        headline2: TextStyle(
          color: NewsColors.fontDark,
          fontSize: NewsFontSize.headline2,
          fontWeight: NewsFontWeight.bold,
        ),

        headline3: TextStyle(
          color: NewsColors.fontDark,
          fontSize: NewsFontSize.headline3,
          fontWeight: NewsFontWeight.bold,
        ),

        bodyText1: TextStyle(
          color: NewsColors.fontDark,
          fontSize: NewsFontSize.bodyText1,
          fontWeight: NewsFontWeight.regular,
        ),

        bodyText2: TextStyle(
          color: NewsColors.fontDark,
          fontSize: NewsFontSize.bodyText2,
          fontWeight: NewsFontWeight.regular,
        ),

        subtitle1: TextStyle(
          color: NewsColors.fontDark,
          fontSize: NewsFontSize.subtitle1,
          fontWeight: NewsFontWeight.extraLight,
        ),

        subtitle2: TextStyle(
          color: NewsColors.fontDark,
          fontSize: NewsFontSize.subtitle2,
          fontWeight: NewsFontWeight.extraLight,
        ),

        caption: TextStyle(
          color: NewsColors.linkLight,
          fontSize: NewsFontSize.caption,
          fontWeight: NewsFontWeight.light,
        ),
      ),
      fontFamily: 'Kanit'
  );
}
