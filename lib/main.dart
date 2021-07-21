import 'package:flutter/material.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:logging/logging.dart';
import 'package:news_app/service/news_service.dart';
import 'package:news_app/ui/home_screen.dart';
import 'package:news_app/ui/values/colors/news_colors.dart';
import 'package:news_app/ui/values/fonts/news_font.dart';
import 'package:provider/provider.dart';

void main() async{
  _setupLogging();
  await dotenv.load();
  runApp(MyApp());
}

void _setupLogging(){
  Logger.root.level = Level.ALL;
  Logger.root.onRecord.listen((rec) {
    print('${rec.level.name}: ${rec.time}: ${rec.message}');
  });
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Provider(
      create: (_) => NewsService.create(),
      dispose: (_, NewsService service) => service.client.dispose(),
      child: MaterialApp(
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
                fontWeight: NewsFonts.regular,
              ),

              bodyText2: TextStyle(
                color: NewsColors.fontDark,
                fontSize: 15,
                fontWeight: NewsFonts.regular,
              ),

              subtitle1: TextStyle(
                color: NewsColors.fontLight,
                fontSize: 17,
                fontWeight: NewsFonts.extraLight,
              ),

              subtitle2: TextStyle(
                color: NewsColors.fontDark,
                fontSize: 15,
                fontWeight: NewsFonts.extraLight,
              ),

              caption: TextStyle(
                color: NewsColors.linkDark,
                fontSize: 20,
                fontWeight: NewsFonts.light,
              ),
            ),
            fontFamily: 'Kanit'
        ),
        home: HomeScreen(),
      ),
    );
  }
}

