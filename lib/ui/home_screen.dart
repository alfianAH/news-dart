import 'package:chopper/chopper.dart';
import 'package:flutter/material.dart';
import 'package:news_app/model/news_model.dart';
import 'package:news_app/service/news_service.dart';
import 'package:news_app/ui/menu_item.dart';
import 'package:news_app/ui/news_list.dart';
import 'package:news_app/ui/values/colors/news_colors.dart';
import 'package:news_app/ui/values/constants/constants.dart';
import 'package:news_app/ui/values/menu/news_category_menu.dart';
import 'package:provider/provider.dart';

class HomeScreen extends StatefulWidget{
  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  String _searchText = '';
  final _searchTextController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    TextTheme textTheme = Theme.of(context).textTheme;

    return Scaffold(
      appBar: AppBar(
        title: Padding(
          padding: const EdgeInsets.only(
            right: 16,
            top: 16,
            bottom: 16
          ),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Expanded(
                flex: 1,
                child: Text(
                    'Berita',
                    style: textTheme.headline1
                ),
              ),

              // Search bar
              Expanded(
                flex: 2,
                child: Card(
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(10)
                  ),
                  child: Padding(
                    padding: const EdgeInsets.only(
                      left: 16,
                      right: 16,
                    ),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Expanded(
                          flex: 2,
                          child: TextFormField(
                            controller: _searchTextController,
                            style: TextStyle(
                              color: NewsColors.fontDark,
                            ),
                            decoration: InputDecoration(
                              hintText: 'Type your search...',
                            ),
                          ),
                        ),

                        Expanded(
                          flex: 1,
                          child: IconButton(
                            onPressed: (){
                              showDialog(context: context, builder: (context){
                                return AlertDialog(
                                  content: Text('You search $_searchText'),
                                );
                              });
                            },
                            icon: Icon(
                              Icons.search_rounded,
                              color: Color.fromRGBO(144, 144, 144, 1),
                            )
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              )
            ]
          ),
        )
      ),

      // Menu Drawer
      drawer: Drawer(
        child: ListView.builder(
          itemBuilder: (context, index){
            final NewsCategoryMenu newsCategoryMenu = newsCategoryMenuList[index];

            return Container(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  // Drawer Header
                  Container(
                    height: AppBar().preferredSize.height,
                    child: DrawerHeader(
                      decoration: BoxDecoration(
                        color: NewsColors.primaryColor
                      ),
                      padding: const EdgeInsets.symmetric(
                        vertical: 10,
                        horizontal: 16
                      ),
                      margin: const EdgeInsets.all(0),
                      child: Text(
                        'Menu',
                        style: textTheme.headline1,
                      ),
                    )
                  ),

                  // Menu items
                  MenuItem(newsCategoryMenu: newsCategoryMenu),
                ],
              ),
            );
          },
          itemCount: newsCategoryMenuList.length,
        ),
      ),

      body: FutureBuilder<Response<NewsModel>>(
        future: Provider.of<NewsService>(context).getNews(apiKey),
        builder: (context, snapshot){
          if(snapshot.connectionState == ConnectionState.done){
            if(snapshot.hasError){
              return Center(
                child: Text(
                  snapshot.error.toString(),
                  style: textTheme.bodyText1,
                ),
              );
            }

            final newsResponse = snapshot.data!.body;

            return NewsList(
              newsModel: newsResponse,
              listTitle: 'Berita Utama',
            );
          } else{
            // Show loading
            return Center(
              child: CircularProgressIndicator(),
            );
          }
        },
      ),
    );
  }

  @override
  void dispose() {
    super.dispose();
    _searchTextController.dispose();
  }
}