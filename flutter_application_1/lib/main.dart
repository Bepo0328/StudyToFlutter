import 'package:flutter/material.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: "Myapp",
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: MyPage(),
    );
  }
}

class MyPage extends StatelessWidget {
  const MyPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.blue,
      body: SafeArea(
        child: Container(
          color: Colors.red,
          width: 100.0,
          height: 100.0,
          // margin: EdgeInsets.all(20.0),
          margin: EdgeInsets.symmetric(vertical: 50.0, horizontal: 10.0),
          padding: EdgeInsets.all(40.0),
          child: Text("Hello"),
        ),
      ),
    );
  }
}
