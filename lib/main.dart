import 'package:flutter/material.dart';
import 'package:flutter_redux/flutter_redux.dart';
import 'package:SocialMediaComment/view/main_page.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.grey,
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      home: MyHomePage(title: 'T E C H N I C A L   T E S T '),
    );
  }
}
