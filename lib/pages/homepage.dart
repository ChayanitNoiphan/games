import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'gamepage.dart';

class Homepage extends StatefulWidget {
  const Homepage({Key? key}) : super(key: key);

  @override
  State<Homepage> createState() => _HomepageState();
}

class _HomepageState extends State<Homepage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        constraints: const BoxConstraints.expand(),
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
                decoration: BoxDecoration(
                    //color: Colors.indigo,
                    borderRadius: BorderRadius.circular(8),
                    gradient: const LinearGradient(
                        colors: [Colors.indigo, Colors.blueAccent]),
                    border: Border.all(
                      color: Colors.black,
                      width: 2.0,
                    ),
                    boxShadow: const [
                      BoxShadow(
                          color: Colors.grey,
                          blurRadius: 2.0,
                          offset: Offset(2.0, 2.0))
                    ]),
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Text(
                    'เกมทายสำนวนสุภาษิตไทย',
                    style: GoogleFonts.prompt(
                      fontSize: 30,
                      color: Colors.white,
                    ),
                  ),
                ),
              ),
              const SizedBox(
                height: 60.0,
              ),
              Stack(alignment: AlignmentDirectional.center, children: [
                Container(
                  padding: const EdgeInsets.all(40),
                  margin: const EdgeInsets.all(10),
                  decoration: BoxDecoration(
                    color: Colors.grey.shade50,
                    borderRadius: BorderRadius.circular(8),
                    boxShadow: const [
                      BoxShadow(
                        color: Colors.black,
                        offset: Offset(
                          3.0,
                          3.0,
                        ), //Offset
                        blurRadius: 10.0,
                        spreadRadius: 2.0,
                      ), //BoxShadow
                      BoxShadow(
                        color: Colors.white,
                        offset: Offset(0.0, 0.0),
                        blurRadius: 0.0,
                        spreadRadius: 0.0,
                      ), //BoxShadow
                    ],
                  ),
                  child: Column(
                    children: [
                      const SizedBox(
                        height: 20.0,
                      ),
                      Text(
                        'จับคู่สำนวนสุภาษิตไทยกับความหมายให้ถูกต้อง',
                        style: GoogleFonts.prompt(
                          fontSize: 19.0,
                        ),
                      ),
                      Text(
                        'เมื่อจับคู่ถูกจะได้รับ 1 คะแนน',
                        style: GoogleFonts.prompt(
                          fontSize: 19.0,
                        ),
                      ),
                      Text(
                        'เมื่อจบเกม สามารถกดสุ่มสำนวนสุภาษิตเพื่อจับคู่ใหม่ได้',
                        style: GoogleFonts.prompt(
                          fontSize: 19.0,
                        ),
                      ),
                      const SizedBox(
                        height: 20.0,
                      ),
                    ],
                  ),
                ),
                Positioned(
                  bottom: 0,
                  child: ElevatedButton(
                    onPressed: () {
                      Navigator.push(context,
                          MaterialPageRoute(builder: (_) => new gamepage()));
                    },
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.blueAccent,
                    ),
                    child: Text(
                      "เริ่มเกม",
                      style: GoogleFonts.prompt(fontSize: 25),
                    ),
                  ),
                ),
                Positioned(
                  top: 1,
                  child: Container(
                    //padding: const EdgeInsets.all(40),
                    //margin: const EdgeInsets.all(10),
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(8),
                        gradient: const LinearGradient(
                            colors: [Colors.indigo, Colors.blueAccent]),
                        boxShadow: const [
                          BoxShadow(
                              color: Colors.grey,
                              blurRadius: 2.0,
                              offset: Offset(2.0, 2.0))
                        ]),
                    child: Padding(
                      padding: const EdgeInsets.only(left: 25.0, right: 25.0),
                      child: Text(
                        "กติกา",
                        style: GoogleFonts.prompt(
                            fontSize: 25, color: Colors.white),
                      ),
                    ),
                  ),
                ),
              ]),
            ],
          ),
        ),
      ),
    );
  }
}
