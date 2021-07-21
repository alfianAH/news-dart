import 'package:flutter/material.dart';
import 'package:news_app/ui/appbar/mobile_appbar.dart';
import 'package:news_app/ui/category_detail_screen.dart';
import 'package:news_app/ui/values/categories/news_category.dart';

class CategoryScreen extends StatelessWidget{
  @override
  Widget build(BuildContext context) {
    TextTheme textTheme = Theme.of(context).textTheme;

    return Scaffold(
      appBar: MobileAppBar(
        appBar: AppBar(),
        appBarTitle: 'Kategori',
      ),

      body: SingleChildScrollView(
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
                shrinkWrap: true,
                crossAxisCount: 2,
                crossAxisSpacing: 16,
                mainAxisSpacing: 16,
                childAspectRatio: 3,

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
                        child: Row(
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            Icon(newsCategory.categoryIcon),

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
}