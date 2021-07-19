import 'package:flutter/material.dart';

class MobileAppBar extends StatelessWidget implements PreferredSizeWidget{
  final AppBar appBar;
  final String appBarTitle;

  MobileAppBar({
    required this.appBar,
    required this.appBarTitle
  });

  @override
  Widget build(BuildContext context) {
    TextTheme textTheme = Theme.of(context).textTheme;

    return AppBar(
      title: Text(
        appBarTitle,
        style: textTheme.headline1,
      ),

      // Back button
      leading: IconButton(
        onPressed: () {
          Navigator.pop(context);
        },
        icon: Icon(
          Icons.arrow_back_ios_rounded
        ),
      ),
    );
  }

  @override
  Size get preferredSize => Size.fromHeight(appBar.preferredSize.height);
}