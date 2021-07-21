import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:news_app/model/news_model.dart';
import 'package:news_app/ui/appbar/mobile_appbar.dart';
import 'package:news_app/ui/values/colors/news_colors.dart';
import 'package:url_launcher/url_launcher.dart';

class DetailScreen extends StatelessWidget{
  final Articles newsArticle;

  DetailScreen({required this.newsArticle});

  @override
  Widget build(BuildContext context) {
    TextTheme textTheme = Theme.of(context).textTheme;

    return Scaffold(
      appBar: MobileAppBar(
        appBar: AppBar(),
        appBarTitle: 'Berita',
      ),

      body: SingleChildScrollView(
        child: Container(
          padding: const EdgeInsets.all(16),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // News title
              Text(
                newsArticle.title.toString(),
                style: textTheme.headline2,
              ),

              SizedBox(height: 8,),

              // News date
              Text(
                '${newsArticle.publishedAt.toString()} by ${newsArticle.author.toString()}',
                style: textTheme.subtitle1
              ),

              SizedBox(height: 16,),

              // News image
              Image.network(
                newsArticle.urlToImage.toString(),
                errorBuilder: (context, exception, stackTrace){
                  return Icon(
                    Icons.broken_image,
                    color: NewsColors.fontLight,
                    size: 75,
                  );
                },
              ),

              SizedBox(height: 8,),

              // News link
              RichText(
                text: TextSpan(
                  text: 'Klik untuk melihat artikel asli.',
                  style: textTheme.caption,
                  recognizer: TapGestureRecognizer()
                    ..onTap = () {
                      launch(newsArticle.url.toString());
                    }
                ),
              ),

              SizedBox(height: 16,),

              // News content
              Text(
                newsArticle.content.toString(),
                style: textTheme.bodyText1,
              ),
            ]
          ),
        ),
      )
    );
  }
}