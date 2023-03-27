import 'package:flutter/material.dart';

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
          image: DecorationImage(
            image: AssetImage('assets/images/bk.jpg'),
            fit: BoxFit.fill
          ),
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Column(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                const SizedBox(
                  height: 10.0,
                ),
                Container(
                  color: Colors.indigo,
                  child: const Padding(
                    padding: EdgeInsets.all(8.0),
                    child: Text('เกมทายสำนวนสุภาษิตไทย',style: TextStyle(
                      fontSize: 30.0,
                    ),),
                  ),
                ),
                Container(
                  color: Colors.pink,
                  child: Column(
                    children: const [
                      Text("กติกา" ,style: TextStyle(
                        fontSize: 20.0,
                      ),),
                      Text('มีเวลารอบละ 60 วินาที ทายคำสุภาษิตจากรูปภาพ',style: TextStyle(
                        fontSize: 16.0,
                      ),),
                      Text('ทายถูกจะได้รับ 1 คะแนนแต่ถ้าทายผิด จบเกม',style: TextStyle(
                        fontSize: 16.0,
                      ),),
                      Text('เมื่อจบเกม จะแสดงคะแนนสูงสุด',style: TextStyle(
                        fontSize: 16.0,
                      ),),
                    ],
                  ),
                ),
                ElevatedButton(onPressed: (){Navigator.push(context,
                    MaterialPageRoute(builder: (_) => new gamepage()));
                  }, child: const Padding(
                  padding: EdgeInsets.all(8.0),
                  child: Text("เริ่มเกม"),
                ))
              ],
            ),
          ],
        ),
      ),
    );
  }
}
