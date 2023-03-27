import 'package:flutter/material.dart';

class gamepage extends StatefulWidget {
  const gamepage({Key? key}) : super(key: key);

  @override
  State<gamepage> createState() => _gamepageState();
}

class _gamepageState extends State<gamepage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: BackButton(color: Colors.black),
        backgroundColor: Colors.pink,
      ),
    );
  }
}
