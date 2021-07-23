import 'package:flutter/material.dart';
import 'package:news_app/ui/appbar/mobile_appbar.dart';
import 'package:news_app/ui/category_detail_screen.dart';
import 'package:news_app/ui/values/categories/news_category.dart';

class CategoryScreen extends StatefulWidget{
  @override
  _CategoryScreenState createState() => _CategoryScreenState();
}

class _CategoryScreenState extends State<CategoryScreen> {
  final ScrollController _scrollController = ScrollController();

  @override
  Widget build(BuildContext context) {
    TextTheme textTheme = Theme.of(context).textTheme;

    return Scaffold(
      appBar: MobileAppBar(
        appBar: AppBar(),
        appBarTitle: 'Kategori',
      ),

      body: SingleChildScrollView(
        controller: _scrollController,
        child: Container(
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
              GridView.count(
                controller: _scrollController,
                shrinkWrap: true,
                crossAxisCount: 2,
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
                              size: 100,
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
            ]
          ),
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