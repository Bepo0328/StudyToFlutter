import 'package:flutter/material.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: MyButtons(),
    );
  }
}

class MyButtons extends StatelessWidget {
  const MyButtons({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Buttons"),
        centerTitle: true,
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            TextButton(
              onPressed: () {
                print("Short Clicked Button");
              },
              onLongPress: () {
                print("Long Clicked Button");
              },
              child: Text(
                "Text Button",
                style: TextStyle(
                  fontSize: 20.0,
                ),
              ),
              style: TextButton.styleFrom(
                primary: Colors.red,
                // backgroundColor: Colors.blue,
              ),
            ),
            ElevatedButton(
              onPressed: () {
                print("Elevated Button Clicked");
              },
              child: Text("Elevated Button"),
              style: ElevatedButton.styleFrom(
                primary: Colors.orangeAccent,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(10.0),
                ),
                elevation: 0.0,
              ),
            ),
            OutlinedButton(
              onPressed: () {
                print("Outlined Button Clicked");
              },
              child: Text("Outlined Button"),
              style: OutlinedButton.styleFrom(
                primary: Colors.green,
                // side: BorderSide(
                //   color: Colors.black87,
                //   width: 2.0,
                // ),
              ),
            ),
            TextButton.icon(
              onPressed: () {
                print("Text Button Icon Clicked");
              },
              icon: Icon(
                Icons.home,
                size: 30.0,
                // color: Colors.black87,
              ),
              label: Text("Go to home"),
              style: TextButton.styleFrom(
                primary: Colors.purple,
              ),
            ),
            ElevatedButton.icon(
              onPressed: () {
                print("Elevated Button Icon Clicked");
              },
              icon: Icon(
                Icons.home,
                size: 20.0,
              ),
              label: Text("Go to home"),
              style: ElevatedButton.styleFrom(
                primary: Colors.black,
                minimumSize: Size(200, 50),
              ),
            ),
            OutlinedButton.icon(
              onPressed: () {
                print("Outlined Button Icon Clicked");
              },
              icon: Icon(
                Icons.home,
              ),
              label: Text("Go to home"),
              style: OutlinedButton.styleFrom(
                primary: Colors.black,
              ),
            ),
            ElevatedButton.icon(
              onPressed: null,
              icon: Icon(
                Icons.home,
                size: 20.0,
              ),
              label: Text("Go to home"),
              style: ElevatedButton.styleFrom(
                primary: Colors.black,
                onSurface: Colors.pink,
              ),
            ),
            ButtonBar(
              alignment: MainAxisAlignment.center,
              buttonPadding: EdgeInsets.all(20.0),
              children: [
                TextButton(
                  onPressed: () {},
                  child: Text("Text Button"),
                ),
                ElevatedButton(
                  onPressed: () {},
                  child: Text("Elevated Button"),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
