import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:news_app/model/news_model.dart';
import 'package:news_app/ui/news/list/news_list_1000.dart';
import 'package:news_app/ui/news/list/news_list_600.dart';
import 'package:news_app/ui/news/list/news_list_search.dart';

class NewsList extends StatefulWidget{
  final NewsModel newsModel;
  final String listTitle;
  final bool isFromSearch;

  NewsList({
    required this.newsModel,
    required this.listTitle,
    required this.isFromSearch
  });

  @override
  _NewsListState createState() => _NewsListState();
}

class _NewsListState extends State<NewsList> {
  final ScrollController _scrollController = ScrollController();

  @override
  Widget build(BuildContext context) {
    TextTheme textTheme = Theme.of(context).textTheme;

    return LayoutBuilder(
      builder: (context, constraints){
        // Check wheter is from search screen or not
        // If from search screen, show specified news list
        if(widget.isFromSearch){
          return NewsListSearch(
            scrollController: _scrollController,
            textTheme: textTheme,
            widget: widget,
          );
        } else{ // Else, show original news list
          // Check max width
          if(constraints.maxWidth <= 600){
            return NewsList600(
              scrollController: _scrollController,
              textTheme: textTheme,
              widget: widget,
            );
          } else if(constraints.maxWidth <= 1000){
            return NewsList1000(
              scrollController: _scrollController,
              textTheme: textTheme,
              widget: widget,
              itemCount: 3
            );
          } else{
            return NewsList1000(
              scrollController: _scrollController,
              textTheme: textTheme,
              widget: widget,
              itemCount: 5
            );
          }
        }
      }
    );
  }

  @override
  void dispose() {
    _scrollController.dispose();
    super.dispose();
  }
}
