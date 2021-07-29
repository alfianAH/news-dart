import 'package:flutter/material.dart';
import 'package:news_app/ui/appbar/mobile_appbar.dart';
import 'package:news_app/ui/category/category_detail_screen.dart';
import 'package:news_app/ui/values/categories/news_category.dart';

class CategoryScreen extends StatefulWidget{
  @override
  _CategoryScreenState createState() => _CategoryScreenState();
}

class _CategoryScreenState extends State<CategoryScreen> {
  final ScrollController _scrollController = ScrollController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: MobileAppBar(
        appBar: AppBar(),
        appBarTitle: 'Kategori',
      ),

      body: SingleChildScrollView(
        controller: _scrollController,
        child: LayoutBuilder(
          builder: (context, constraints){
            // Check max width
            if(constraints.maxWidth > 1000){
              // Grid view: 6
              return _CategoryScreenGridView(
                scrollController: _scrollController,
                gridCount: 6
              );
            } else if(constraints.maxWidth > 800){
              // Grid view: 4
              return _CategoryScreenGridView(
                scrollController: _scrollController,
                gridCount: 4
              );
            } else if(constraints.maxWidth > 600){
              // Grid view: 3
              return _CategoryScreenGridView(
                scrollController: _scrollController,
                gridCount: 3
              );
            } else if(constraints.maxWidth > 350){
              // Grid view: 2
              return _CategoryScreenGridView(
                scrollController: _scrollController,
                gridCount: 2,
              );
            } else{
              // List view
              return _CategoryScreenListView(
                scrollController: _scrollController,
              );
            }
          }
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

class _CategoryScreenGridView extends StatelessWidget{
  final ScrollController scrollController;
  final int gridCount;

  _CategoryScreenGridView({
    required this.scrollController,
    required this.gridCount
  });

  @override
  Widget build(BuildContext context) {
    TextTheme textTheme = Theme.of(context).textTheme;

    return Container(
      padding: const EdgeInsets.all(16),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // Title
          Text(
            'Pilih kategori beritamu',
            style: textTheme.headline2,
          ),

          SizedBox(height: 16,),

          // Categories
          Center(
            child: GridView.count(
              controller: scrollController,
              shrinkWrap: true,
              crossAxisCount: gridCount,
              crossAxisSpacing: 16,
              mainAxisSpacing: 16,

              children: newsCategoryList.map((newsCategory){
                return InkWell(
                  onTap: (){
                    Navigator.push(context, MaterialPageRoute(builder: (context){
                      return CategoryDetailScreen(
                        categoryTitle: newsCategory.categoryName,
                        categoryId: newsCategory.categoryId,
                      );
                    }));
                  },

                  child: Card(
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(10)
                    ),
                    child: Padding(
                      padding: const EdgeInsets.all(16),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Icon(
                            newsCategory.categoryIcon,
                            size: 75,
                          ),

                          SizedBox(width: 16,),

                          Text(
                            newsCategory.categoryName,
                            style: textTheme.headline3,
                          )
                        ],
                      ),
                    ),
                  ),
                );
              }).toList(),
            ),
          ),
        ]
      ),
    );
  }
}

class _CategoryScreenListView extends StatelessWidget{
  final ScrollController scrollController;

  _CategoryScreenListView({
    required this.scrollController,
  });

  @override
  Widget build(BuildContext context) {
    TextTheme textTheme = Theme.of(context).textTheme;

    return Container(
      padding: const EdgeInsets.all(16),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // Title
          Text(
            'Pilih kategori beritamu',
            style: textTheme.headline2,
          ),

          SizedBox(height: 16,),

          // Categories
          ListView.builder(
            controller: scrollController,
            shrinkWrap: true,
            itemCount: newsCategoryList.length,
            itemBuilder: (context, index){
              NewsCategory newsCategory = newsCategoryList[index];

              return InkWell(
                onTap: (){
                  Navigator.push(context, MaterialPageRoute(builder: (context){
                    return CategoryDetailScreen(
                      categoryTitle: newsCategory.categoryName,
                      categoryId: newsCategory.categoryId,
                    );
                  }));
                },

                child: Card(
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(10)
                  ),
                  child: Padding(
                    padding: const EdgeInsets.all(16),
                    child: Text(
                      newsCategory.categoryName,
                      style: textTheme.headline3,
                    )
                  ),
                ),
              );
            }
          ),
        ]
      ),
    );
  }
}