import 'package:flutter/material.dart';
import 'package:news_app/ui/detail_screen.dart';
import 'package:news_app/ui/values/colors/news_colors.dart';

class NewsItem extends StatefulWidget{
  @override
  _NewsItemState createState() => _NewsItemState();
}

class _NewsItemState extends State<NewsItem> {
  @override
  Widget build(BuildContext context) {
    TextTheme textTheme = Theme.of(context).textTheme;

    return Container(
      child: Padding(
        padding: const EdgeInsets.only(top: 8),
        child: InkWell(
          onTap: (){
            Navigator.push(context, MaterialPageRoute(builder: (context){
              return DetailScreen();
            }));
          },
          child: Card(
            color: NewsColors.card,
            shape: RoundedRectangleBorder(
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
                      height: 135,
                      child: Image.network(
                        'https://asset.kompas.com/crops/xAqIt1VurCw-ncN41E0vag75IbQ=/0x0:1000x667/780x390/filters:watermark(data/photo/2020/03/10/5e6775d554370.png,0,-0,1)/data/photo/2020/11/06/5fa565d9943e3.jpg',
                        fit: BoxFit.fitHeight,
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
                          'Lorem ipsum dolor sit amet',
                          style: textTheme.headline3,
                          maxLines: 1,
                          overflow: TextOverflow.ellipsis,
                        ),

                        // News date
                        Text(
                          'News date',
                          style: textTheme.subtitle2,
                          maxLines: 1,
                          overflow: TextOverflow.ellipsis,
                        ),

                        // News content
                        Text(
                          'Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua',
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