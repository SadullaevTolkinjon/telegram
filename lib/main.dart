import 'package:flutter/material.dart';

import 'package:homeworkonolti/roots/routes.dart';

void main() {
  runApp(MyApplication());
}

class MyApplication extends StatefulWidget {
  @override
  State<MyApplication> createState() => _MyApplicationState();
}

class _MyApplicationState extends State<MyApplication> {
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: "Flutter Demo",
      initialRoute: "/telegram",
      onGenerateRoute: (settings) => RouterGenerator.generateRoute(settings),
    );
  }
}
