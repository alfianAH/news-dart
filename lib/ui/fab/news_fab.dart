import 'package:flutter/material.dart';

class NewsFloatingActionButton extends StatefulWidget{
  final ValueNotifier<ThemeMode> notifier;
  final ThemeMode currentTheme;

  NewsFloatingActionButton({
    required this.notifier,
    required this.currentTheme
  });

  @override
  _NewsFloatingActionButtonState createState() => _NewsFloatingActionButtonState();
}

class _NewsFloatingActionButtonState extends State<NewsFloatingActionButton> {
  bool isLight = false;
  ThemeMode themeMode = ThemeMode.dark;

  @override
  Widget build(BuildContext context) {
    return FloatingActionButton(
      onPressed: (){
        // Set bool state
        setState(() {
          isLight = !isLight;
          widget.notifier.value = widget.currentTheme == ThemeMode.dark
              ? ThemeMode.light : ThemeMode.dark;
        });
      },

      elevation: 0,

      backgroundColor: isLight
          ? Color.fromRGBO(233, 233, 233, 0.75) // Light
          : Color.fromRGBO(0, 0, 0, 0.75), // Dark

      child: isLight
          ? Icon( // Light
            Icons.dark_mode_rounded,
            color: Color.fromRGBO(0, 0, 0, 0.75),
          )
          : Icon( // Dark
            Icons.light_mode_rounded,
            color: Color.fromRGBO(255, 245, 0, 0.75),
          ),
    );
  }
}