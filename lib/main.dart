import 'package:bmi/screens/input_page.dart';
import 'package:flutter/material.dart';

import 'Utilities/constants.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(
        appBarTheme: const AppBarTheme(
          color: kAppBarColor,
          titleTextStyle: TextStyle(
            color: kWhiteTextColor,
            fontSize: 20,
          ),
        ),
        scaffoldBackgroundColor: kScaffoldColor,
      ),
      home: const InputPage(),
    );
  }
}
