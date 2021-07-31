import 'package:flutter/material.dart';
import 'package:logging/logging.dart';
import 'package:news_app/service/news_service.dart';
import 'package:news_app/ui/home/home_screen.dart';
import 'package:news_app/ui/values/theme/news_theme.dart';
import 'package:provider/provider.dart';

void main() async{
  _setupLogging();
  runApp(MyApp());
}

void _setupLogging(){
  Logger.root.level = Level.ALL;
  Logger.root.onRecord.listen((rec) {
    print('${rec.level.name}: ${rec.time}: ${rec.message}');
  });
}

class MyApp extends StatelessWidget {
  final ValueNotifier<ThemeMode> _notifier = ValueNotifier(ThemeMode.dark);

  @override
  Widget build(BuildContext context) {
    return Provider(
      create: (_) => NewsService.create(),
      dispose: (_, NewsService service) => service.client.dispose(),
      child: ValueListenableBuilder<ThemeMode>(
        valueListenable: _notifier,
        builder: (context, mode, child){
          return MaterialApp(
            title: 'Berita Indonesia',
            theme: NewsTheme.lightTheme,
            darkTheme: NewsTheme.darkTheme,
            themeMode: mode,
            home: HomeScreen(
              notifier: _notifier,
              currentTheme: mode,
            ),
          );
        },
      ),
    );
  }
}
