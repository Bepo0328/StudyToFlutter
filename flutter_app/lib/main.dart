import 'package:flutter/material.dart';
import 'package:flutter_app/screen_a.dart';
import 'package:flutter_app/screen_b.dart';
import 'package:flutter_app/screen_c.dart';

void main() => runApp(const MyApp());

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      initialRoute: "/",
      routes: {
        "/" : (context) => const ScreenA(),
        "/b" : (context) => const ScreenB(),
        "/c" : (context) => const ScreenC(),
      },
    );
  }
}

