import 'package:flutter/material.dart';

class Dice extends StatelessWidget {
  const Dice({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Dice game"),
        backgroundColor: Colors.blue,
      ),
      body: Center(
        child: Text("Dice game page"),
      ),
    );
  }
}
