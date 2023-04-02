import 'dart:math';

import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import '../data/datas.dart';


class gamepage extends StatefulWidget {
  const gamepage({Key? key}) : super(key: key);

  @override
  State<gamepage> createState() => _gamepageState();
}

class _gamepageState extends State<gamepage> {
  data Data = data();
  List word = [];
  List mean = [];

  @override
  void initState() {
    init();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: const BackButton(color: Colors.black),
        backgroundColor: Colors.indigo,
        title: Text(
          'เกมทายสุภาษิตภาษาไทยจากรูปภาพ',
          style: GoogleFonts.prompt(),
        ),
      ),
      body: Container(
        decoration: const BoxDecoration(
            gradient: LinearGradient(
              begin: Alignment.topRight,
              end: Alignment.bottomLeft,
              colors: [
                Colors.white,
                Colors.greenAccent,
                Colors.green,
              ],
            )
        ),
        child: Center(
          child: Container(
            width: 550,
            height: 470,
            padding: const EdgeInsets.all(30),
            margin: const EdgeInsets.all(10),
            decoration: BoxDecoration(
              color: Colors.white.withOpacity(0.5),
              borderRadius: BorderRadius.circular(20),

            ),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                for(var i = 0; i < 4; i++)
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      _buildword(word[i]),
                      _buildmean(mean[i]),
                    ],
                  )
              ],
            ),
          ),
        ),
      ),
    );
  }

  void init() {
    Data.RandomNumber();
    word = Data.getWordlist();
    mean = Data.getMeanlist();
  }

  Widget _buildword(String word){

    return Padding(
      padding: const EdgeInsets.all(20.0),
      child: ElevatedButton(
        onPressed: () {},
        style: ElevatedButton.styleFrom(
            fixedSize: const Size(200, 60),
            backgroundColor: Colors.white),
        child:  Text('$word',
          style: const TextStyle(color: Colors.indigo,
            fontWeight: FontWeight.bold,fontSize: 16,
          ),
        ),
      ),
    );
  }
  Widget _buildmean(String mean){
    return Padding(
      padding: const EdgeInsets.all(20.0),
      child: ElevatedButton(
        onPressed: () {},
        style: ElevatedButton.styleFrom(
            fixedSize: const Size(200, 60),
            backgroundColor: Colors.white),
        child: Text('$mean',
          style: const TextStyle(color: Colors.indigo,
            fontWeight: FontWeight.bold,fontSize: 13,
          ),
        ),
      ),
    );
  }
}
