import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:news_app/model/news_model.dart';
import 'package:news_app/ui/news_item.dart';

class NewsList extends StatefulWidget{
  final NewsModel newsModel;
  final String listTitle;

  NewsList({
    required this.newsModel,
    required this.listTitle
  });

  @override
  _NewsListState createState() => _NewsListState();
}

class _NewsListState extends State<NewsList> {
  final ScrollController _scrollController = ScrollController();

  @override
  Widget build(BuildContext context) {
    TextTheme textTheme = Theme.of(context).textTheme;

    return SingleChildScrollView(
      controller: _scrollController,
      child: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Title
            Text(
              widget.listTitle,
              style: textTheme.headline2,
              maxLines: 2,
              overflow: TextOverflow.ellipsis,
            ),

            // News list
            ListView.builder(
              controller: _scrollController,
              shrinkWrap: true,
              itemBuilder: (context, index){
                // Check image URL is null or not
                Articles newsArticle = widget.newsModel.articles![index]!;

                // If image URL is not null, show it on list
                if(newsArticle.urlToImage != null ||
                    newsArticle.url != null) {
                  return NewsItem(newsArticle: widget.newsModel.articles![index]!);
                } else { // Else, skip it
                  print('${newsArticle.title} has null url');
                  return SizedBox.shrink();
                }
              },
              itemCount: widget.newsModel.articles!.length,
            ),
          ],
        ),
      )
    );
  }

  @override
  void dispose() {
    _scrollController.dispose();
    super.dispose();
  }
}