import 'package:flutter/material.dart';

class New_Page extends StatelessWidget {
  const New_Page({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Hi there")),
      body: Container(
        height: 110,
        width: 100,
        color: Colors.red,
      ),
    );
  }
}
