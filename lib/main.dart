import 'package:flutter/material.dart';
import 'package:flutter_http_web/Pages/TabBarInfoUser.dart';
import 'Pages/HomePage.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: HomePage(
        title: "Users",
      ),
      initialRoute: '/Home',
      routes: {
        '/Home': (context) => HomePage(title: 'Users'),
        '/TabBarInfoUser': (context) => TabBarInfoUser(index: 0, posts: []),
      },
    );
  }
}
