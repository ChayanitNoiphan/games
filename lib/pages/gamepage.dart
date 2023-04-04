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
  List checkOnclick = [false, false, false, false];
  int _point = 0;

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
          'เกมจับคู่สำนวนสุภาษิตกับความหมายให้ถูกต้อง',
          style: GoogleFonts.prompt(),
        ),
        centerTitle: true,
      ),
      body: Container(
        decoration: const BoxDecoration(
            gradient: LinearGradient(
          begin: Alignment.topRight,
          end: Alignment.bottomLeft,
          colors: [
            Colors.white,
            Colors.lightBlueAccent,
            Colors.blueAccent,
            Colors.blue,
          ],
        )),
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Container(
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
                    for (var i = 0; i < 4; i++)
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          _buildword(word[i], i),
                          _buildmean(mean[i], i),
                        ],
                      ),
                  ],
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(12.0),
                child: Text(
                  "$_point/4",
                  style: GoogleFonts.prompt(fontSize: 20),
                ),
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  ElevatedButton(
                    onPressed: () {
                      Navigator.pop(context);
                    },
                    style: ElevatedButton.styleFrom(
                      primary: Colors.lightBlueAccent,
                      padding: const EdgeInsets.all(8),
                    ),
                    child: Text(
                      "กลับหน้าแรก",
                      style: GoogleFonts.prompt(fontSize: 20),
                    ),
                  ),
                  const SizedBox(
                    width: 30,
                  ),
                  ElevatedButton(
                    onPressed: () {
                      Data = data();
                      setState(() {
                        word = [];
                        mean = [];
                        init();
                        _point = 0;
                        checkAnswer = [false, false, false, false];
                        checkAnswerMean = [false, false, false, false];
                        checkOnclick = [false, false, false, false];
                      });
                    },
                    style: ElevatedButton.styleFrom(
                      primary: Colors.lightBlueAccent,
                      padding: const EdgeInsets.all(8),
                    ),
                    child: Text(
                      "สุ่มสำนวนสุภาษิตใหม่",
                      style: GoogleFonts.prompt(fontSize: 20),
                    ),
                  ),
                ],
              )
            ],
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

  int? checkClickword;
  List checkAnswer = [false, false, false, false];
  List checkAnswerMean = [false, false, false, false];

  Widget _buildword(String word, int index) {
    if (!checkAnswer[index]) {
      return Padding(
          padding: const EdgeInsets.all(20.0),
          child: ElevatedButton(
            onPressed: () {
              checkClickword = index;
              setState(() {
                checkOnclick = [false, false, false, false];
                checkOnclick[index] = true;
              });
            },
            style: ElevatedButton.styleFrom(
              fixedSize: const Size(200, 60),
              primary: !checkOnclick[index] ? Colors.white : Colors.greenAccent,
              onPrimary: Colors.green,
            ),
            child: Text(
              '$word',
              style: GoogleFonts.prompt(
                color: Colors.indigo,
                fontSize: 16,
              ),
            ),
          ));
    }
    return const Padding(
      padding: EdgeInsets.all(20.0),
      child: SizedBox(
        width: 200,
        height: 60,
      ),
    );
  }

  Widget _buildmean(String mean, int index) {
    if (!checkAnswerMean[index]) {
      return Padding(
          padding: const EdgeInsets.all(20.0),
          child: ElevatedButton(
            onPressed: () {
              if (checkClickword != null) {
                if (Data.checkMatch(checkClickword!, mean)) {
                  alert1Sec("ถูกต้อง");
                  setState(() {
                    checkAnswer[checkClickword!] = true;
                    checkAnswerMean[index] = true;
                    checkClickword = null;
                    _point++;
                  });
                } else {
                  alert1Sec("ผิด");
                }
              }
            },
            style: ElevatedButton.styleFrom(
              fixedSize: const Size(200, 60),
              primary: Colors.white,
              onPrimary: Colors.green,
            ),
            child: Text(
              '$mean',
              style: GoogleFonts.prompt(
                color: Colors.indigo,
                fontSize: 13,
              ),
            ),
          ));
    }
    return const Padding(
      padding: EdgeInsets.all(20.0),
      child: SizedBox(
        width: 200,
        height: 60,
      ),
    );
  }

  void alert1Sec(String text) {
    showDialog<String>(
        context: context,
        builder: (BuildContext context) {
          Future.delayed(const Duration(seconds: 1), () {
            Navigator.of(context).pop();
          });
          return AlertDialog(
            content: Text(text,
                style: GoogleFonts.prompt(fontSize: 20),
                textAlign: TextAlign.center),
          );
        });
  }
}
