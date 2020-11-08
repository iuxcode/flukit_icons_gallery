import 'package:flutter/material.dart';
import 'package:flutter_unicons_gallery/configs/theme.dart';
import 'package:flutter_unicons_gallery/screens/main.dart';

void main() {
  runApp(App());
}

class App extends StatelessWidget {
  const App({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter unicons',
      theme: appTheme,
      debugShowCheckedModeBanner: false,
      home: MainScreen()
    );
  }
}