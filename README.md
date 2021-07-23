# News Application with Dart

News application with [News API](https://newsapi.org/)

## Getting Started
1. Clone this project
1. Make News API Key from [News API](https://newsapi.org/)
1. Rename [copy.env](copy.env) to `.env` to make configuration file. [Learn how to make it](https://pub.dev/packages/flutter_dotenv)
1. Change `YOUR_API_KEY` with your own API_KEY from News API in `.env` file. (Don't be afraid, because `.env` file won't be pushed to git repository as long as you don't remove it from `.gitignore`)
1. Now you can move to next section

## Run Project
1. Run `flutter pub get` first to get dependencies
1. Run `flutter run --no-sound-null-safety` to run this project or follow the next step to run in Android Studio User Interface
1. Click "Edit configurations" in `main.dart` dropdown
1. Add `--no-sound-null-safety` in "Additional run args"
1. Click "Apply" and "Ok". You can run by clicking "Run" button in Android Studio