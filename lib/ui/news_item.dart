import 'package:flutter/material.dart';
import 'package:news_app/model/news_model.dart';
import 'package:news_app/ui/detail_screen.dart';
import 'package:news_app/ui/values/colors/news_colors.dart';
import 'package:news_app/utils/date_converter.dart';

class NewsItemVertical extends StatelessWidget {
  final Articles newsArticle;

  NewsItemVertical({required this.newsArticle});

  @override
  Widget build(BuildContext context) {
    TextTheme textTheme = Theme.of(context).textTheme;

    return Container(
      child: Padding(
        padding: const EdgeInsets.only(top: 8),
        child: InkWell(
          onTap: (){
            Navigator.push(context, MaterialPageRoute(builder: (context){
              return DetailScreen(newsArticle: newsArticle,);
            }));
          },
          child: Card(
            color: NewsColors.card,
            shape: RoundedRectangleBorder(
              side: BorderSide(color: Colors.black),
              borderRadius: BorderRadius.circular(10),
            ),
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                // News image
                Expanded(
                  flex: 1,
                  child: ClipRRect(
                    borderRadius: BorderRadius.only(
                      topLeft: Radius.circular(10),
                      bottomLeft: Radius.circular(10)
                    ),
                    child: Container(
                      width: 150,
                      height: 150,
                      child: Image.network(
                        newsArticle.urlToImage.toString(),
                        fit: BoxFit.fitHeight,
                        errorBuilder: (context, exception, stackTrace){
                          return Icon(
                            Icons.broken_image,
                            size: 75,
                          );
                        },
                      ),
                    )
                  )
                ),

                SizedBox(width: 8,),

                // News description
                Expanded(
                  flex: 2,
                  child: Padding(
                    padding: const EdgeInsets.fromLTRB(8, 8, 16, 8),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        // News title
                        Text(
                          newsArticle.title.toString(),
                          style: textTheme.headline3,
                          maxLines: 1,
                          overflow: TextOverflow.ellipsis,
                        ),

                        // News date
                        Text(
                          DateConverter.convertDate(newsArticle.publishedAt.toString()),
                          style: textTheme.subtitle2,
                          maxLines: 1,
                          overflow: TextOverflow.ellipsis,
                        ),

                        // News content
                        Text(
                          newsArticle.content.toString(),
                          style: textTheme.bodyText2,
                          maxLines: 3,
                          overflow: TextOverflow.ellipsis,
                        )
                      ],
                    ),
                  ),
                ),
              ],
            ),
          )
        ),
      ),
    );
  }
}

class NewsItemHorizontal extends StatelessWidget {

  final Articles newsArticle;

  NewsItemHorizontal({required this.newsArticle});

  @override
  Widget build(BuildContext context) {
    TextTheme textTheme = Theme.of(context).textTheme;

    return Container(
      width: 250,
      child: Padding(
        padding: const EdgeInsets.only(right: 16),
        child: InkWell(
          onTap: (){
            Navigator.push(context, MaterialPageRoute(builder: (context){
              return DetailScreen(newsArticle: newsArticle,);
            }));
          },
          child: Card(
            color: NewsColors.card,
            shape: RoundedRectangleBorder(
              side: BorderSide(color: Colors.black),
              borderRadius: BorderRadius.circular(10),
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                // News image
                Expanded(
                  flex: 2,
                  child: ClipRRect(
                    borderRadius: BorderRadius.only(
                      topLeft: Radius.circular(10),
                      topRight: Radius.circular(10)
                    ),
                    child: Container(
                      width: 250,
                      height: 250,
                      child: Image.network(
                        newsArticle.urlToImage.toString(),
                        fit: BoxFit.fitWidth,
                        errorBuilder: (context, exception, stackTrace){
                          return Icon(
                            Icons.broken_image,
                            size: 75,
                          );
                        },
                      ),
                    )
                  )
                ),

                // News title
                Expanded(
                  flex: 2,
                  child: Padding(
                    padding: const EdgeInsets.only(
                      top: 12,
                      right: 16,
                      left: 16,
                      bottom: 16
                    ),
                    // News title
                    child: Text(
                      newsArticle.title.toString(),
                      style: textTheme.headline3,
                      maxLines: 3,
                      overflow: TextOverflow.ellipsis,
                    ),
                  ),
                ),
              ],
            ),
          )
        ),
      ),
    );
  }
}