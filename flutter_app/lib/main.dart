// import 'package:flutter/material.dart';
//
// void main() => runApp(const MyApp());
//
// class MyApp extends StatelessWidget {
//   const MyApp({Key? key}) : super(key: key);
//
//   @override
//   Widget build(BuildContext context) {
//     return MaterialApp(
//         home: MyPage(),
//     );
//   }
// }
//
// class MyPage extends StatelessWidget {
//   const MyPage({Key? key}) : super(key: key);
//
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       body: Center(
//         child: RaisedButton(
//           child: Text("Go to ScreenA"),
//           onPressed: () =>
//               Navigator.push(
//                   context, MaterialPageRoute(builder: (context) => ScreenA())),
//         ),
//       ),
//     );
//   }
// }

import 'package:flutter/material.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Builder(
        builder: (context) {
          return Center(
            child: RaisedButton(
              child: Text("Go to ScreenA"),
              onPressed: () =>
                  Navigator.push(
                      context, MaterialPageRoute(builder: (context) => ScreenA())),
            ),
          );
        }
      ),
    );
  }
}

class ScreenA extends StatelessWidget {
  const ScreenA({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Text("Hi, there!"),
      ),
    );
  }
}