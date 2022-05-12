import 'dart:math';

import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: const MyHomePage(),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({Key? key}) : super(key: key);

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  List words = [
    'chilly',
    'doctor',
    'risk',
    'society',
    'hangman',
    'summer',
    'fireman',
    'visitor',
    'wicked',
    'fly',
    'rely'
  ];

  int randomNumber = Random().nextInt(12);

  String test = ' ';
  int check = 0;
  String checkList = ' ';
  int winning = 0;
  String imgPath = 'lib/images/start.jpg';
  _onClick(String x) {
    if (test.contains(x)) {
      checkList += x;
      for (int i = 0; i < test.length; i++) {
        if (test.substring(i, i + 1) == x) {
          winning++;
        }
      }
      if (winning == test.length) {
        check = 0;
        checkList = ' ';
        imgPath = 'lib/images/won.jpg';
        showDialog(
          context: context,
          builder: (_) => AlertDialog(
            title: Text('You Won'),
          ),
        );
      }
    } else {
      check++;
      switch (check) {
        case 1:
          imgPath = 'lib/images/h1.jpg';
          break;
        case 2:
          imgPath = 'lib/images/h2.jpg';
          break;
        case 3:
          imgPath = 'lib/images/h3.jpg';
          break;
        case 4:
          imgPath = 'lib/images/h4.jpg';
          break;
        case 5:
          imgPath = 'lib/images/lost.jpg';
          check = 0;
          checkList = test;
          showDialog(
            context: context,
            builder: (_) => AlertDialog(
              title: Text('You Lost'),
            ),
          );
          break;
      }
    }
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    test = words[randomNumber].toString().toUpperCase();

    return Scaffold(
      body: SafeArea(
        child: Container(
          width: MediaQuery.of(context).size.width,
          height: MediaQuery.of(context).size.height,
          color: Colors.white,
          padding: EdgeInsets.only(top: 25),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.end,
            mainAxisSize: MainAxisSize.min,
            children: <Widget>[
              InkWell(
                onTap: () {
                  randomNumber = Random().nextInt(12);
                  check = 0;
                  checkList = ' ';
                  winning = 0;
                  imgPath = 'lib/images/start.jpg';
                  setState(() {});
                },
                child: Text('Restart',
                    style: TextStyle(color: Colors.red, fontSize: 28)),
              ),
              Container(
                  width: MediaQuery.of(context).size.width,
                  height: MediaQuery.of(context).size.height / 2,
                  child: Image(image: AssetImage(imgPath))),
              Container(
                margin: EdgeInsets.only(bottom: 20),
                width: MediaQuery.of(context).size.width,
                height: 70,
                alignment: Alignment.center,
                child: ListView.builder(
                    scrollDirection: Axis.horizontal,
                    shrinkWrap: true,
                    itemCount: test.length,
                    itemBuilder: (context, index) {
                      String x = test.substring(index, index + 1);
                      if (checkList.contains(x)) {
                        return Column(
                          children: [
                            Letter(
                              letter: x,
                              visibility: true,
                            ),
                            Container(
                                margin: EdgeInsets.symmetric(horizontal: 8),
                                width: 20,
                                height: 3,
                                color: Colors.red)
                          ],
                        );
                      } else {
                        return Column(
                          children: [
                            Letter(
                              letter: test.substring(index, index + 1),
                              visibility: false,
                            ),
                            Container(
                                margin: EdgeInsets.symmetric(horizontal: 8),
                                width: 25,
                                height: 3,
                                color: Colors.red)
                          ],
                        );
                      }
                    }),
              ),
              Container(
                padding: EdgeInsets.symmetric(vertical: 40),
                color: Colors.grey.withOpacity(0.5),
                child: Column(
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        Container(
                          width: 40,
                          height: 40,
                          decoration: BoxDecoration(
                              border: Border.all(color: Colors.grey, width: 1),
                              borderRadius: BorderRadius.circular(10),
                              gradient: LinearGradient(
                                  colors: [Colors.white24, Colors.white54])),
                          child: TextButton(
                              style: TextButton.styleFrom(),
                              onPressed: () {
                                _onClick('Q');
                              },
                              child: Text(
                                'Q',
                                style: TextStyle(
                                    color: Colors.black, fontSize: 18),
                              )),
                        ),
                        Container(
                          width: 40,
                          height: 40,
                          decoration: BoxDecoration(
                              border: Border.all(color: Colors.grey, width: 1),
                              borderRadius: BorderRadius.circular(10),
                              gradient: LinearGradient(
                                  colors: [Colors.white24, Colors.white54])),
                          child: TextButton(
                              style: TextButton.styleFrom(),
                              onPressed: () {
                                _onClick('W');
                              },
                              child: Text(
                                'W',
                                style: TextStyle(
                                    color: Colors.black, fontSize: 18),
                              )),
                        ),
                        Container(
                          width: 40,
                          height: 40,
                          decoration: BoxDecoration(
                              border: Border.all(color: Colors.grey, width: 1),
                              borderRadius: BorderRadius.circular(10),
                              gradient: LinearGradient(
                                  colors: [Colors.white24, Colors.white54])),
                          child: TextButton(
                              style: TextButton.styleFrom(),
                              onPressed: () {
                                _onClick('E');
                              },
                              child: Text(
                                'E',
                                style: TextStyle(
                                    color: Colors.black, fontSize: 18),
                              )),
                        ),
                        Container(
                          width: 40,
                          height: 40,
                          decoration: BoxDecoration(
                              border: Border.all(color: Colors.grey, width: 1),
                              borderRadius: BorderRadius.circular(10),
                              gradient: LinearGradient(
                                  colors: [Colors.white24, Colors.white54])),
                          child: TextButton(
                              style: TextButton.styleFrom(),
                              onPressed: () {
                                _onClick('R');
                              },
                              child: Text(
                                'R',
                                style: TextStyle(
                                    color: Colors.black, fontSize: 18),
                              )),
                        ),
                        Container(
                          width: 40,
                          height: 40,
                          decoration: BoxDecoration(
                              border: Border.all(color: Colors.grey, width: 1),
                              borderRadius: BorderRadius.circular(10),
                              gradient: LinearGradient(
                                  colors: [Colors.white24, Colors.white54])),
                          child: TextButton(
                              style: TextButton.styleFrom(),
                              onPressed: () {
                                _onClick('T');
                              },
                              child: Text(
                                'T',
                                style: TextStyle(
                                    color: Colors.black, fontSize: 18),
                              )),
                        ),
                        Container(
                          width: 40,
                          height: 40,
                          decoration: BoxDecoration(
                              border: Border.all(color: Colors.grey, width: 1),
                              borderRadius: BorderRadius.circular(10),
                              gradient: LinearGradient(
                                  colors: [Colors.white24, Colors.white54])),
                          child: TextButton(
                              style: TextButton.styleFrom(),
                              onPressed: () {
                                _onClick('Y');
                              },
                              child: Text(
                                'Y',
                                style: TextStyle(
                                    color: Colors.black, fontSize: 18),
                              )),
                        ),
                        Container(
                          width: 40,
                          height: 40,
                          decoration: BoxDecoration(
                              border: Border.all(color: Colors.grey, width: 1),
                              borderRadius: BorderRadius.circular(10),
                              gradient: LinearGradient(
                                  colors: [Colors.white24, Colors.white54])),
                          child: TextButton(
                              style: TextButton.styleFrom(),
                              onPressed: () {
                                _onClick('U');
                              },
                              child: Text(
                                'U',
                                style: TextStyle(
                                    color: Colors.black, fontSize: 18),
                              )),
                        ),
                        Container(
                          width: 40,
                          height: 40,
                          decoration: BoxDecoration(
                              border: Border.all(color: Colors.grey, width: 1),
                              borderRadius: BorderRadius.circular(10),
                              gradient: LinearGradient(
                                  colors: [Colors.white24, Colors.white54])),
                          child: TextButton(
                              style: TextButton.styleFrom(),
                              onPressed: () {
                                _onClick('I');
                              },
                              child: Text(
                                'I',
                                style: TextStyle(
                                    color: Colors.black, fontSize: 18),
                              )),
                        ),
                        Container(
                          width: 40,
                          height: 40,
                          decoration: BoxDecoration(
                              border: Border.all(color: Colors.grey, width: 1),
                              borderRadius: BorderRadius.circular(10),
                              gradient: LinearGradient(
                                  colors: [Colors.white24, Colors.white54])),
                          child: TextButton(
                              style: TextButton.styleFrom(),
                              onPressed: () {
                                _onClick('O');
                              },
                              child: Text(
                                'O',
                                style: TextStyle(
                                    color: Colors.black, fontSize: 18),
                              )),
                        ),
                        Container(
                          width: 40,
                          height: 40,
                          decoration: BoxDecoration(
                              border: Border.all(color: Colors.grey, width: 1),
                              borderRadius: BorderRadius.circular(10),
                              gradient: LinearGradient(
                                  colors: [Colors.white24, Colors.white54])),
                          child: TextButton(
                              style: TextButton.styleFrom(),
                              onPressed: () {
                                _onClick('P');
                              },
                              child: Text(
                                'P',
                                style: TextStyle(
                                    color: Colors.black, fontSize: 18),
                              )),
                        ),
                      ],
                    ),
                    Divider(
                      height: 10,
                      color: Colors.transparent,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        Container(
                          width: 40,
                          height: 40,
                          decoration: BoxDecoration(
                              border: Border.all(color: Colors.grey, width: 1),
                              borderRadius: BorderRadius.circular(10),
                              gradient: LinearGradient(
                                  colors: [Colors.white24, Colors.white54])),
                          child: TextButton(
                              style: TextButton.styleFrom(),
                              onPressed: () {
                                _onClick('A');
                              },
                              child: Text(
                                'A',
                                style: TextStyle(
                                    color: Colors.black, fontSize: 18),
                              )),
                        ),
                        Container(
                          width: 40,
                          height: 40,
                          decoration: BoxDecoration(
                              border: Border.all(color: Colors.grey, width: 1),
                              borderRadius: BorderRadius.circular(10),
                              gradient: LinearGradient(
                                  colors: [Colors.white24, Colors.white54])),
                          child: TextButton(
                              style: TextButton.styleFrom(),
                              onPressed: () {
                                _onClick('S');
                              },
                              child: Text(
                                'S',
                                style: TextStyle(
                                    color: Colors.black, fontSize: 18),
                              )),
                        ),
                        Container(
                          width: 40,
                          height: 40,
                          decoration: BoxDecoration(
                              border: Border.all(color: Colors.grey, width: 1),
                              borderRadius: BorderRadius.circular(10),
                              gradient: LinearGradient(
                                  colors: [Colors.white24, Colors.white54])),
                          child: TextButton(
                              style: TextButton.styleFrom(),
                              onPressed: () {
                                _onClick('D');
                              },
                              child: Text(
                                'D',
                                style: TextStyle(
                                    color: Colors.black, fontSize: 18),
                              )),
                        ),
                        Container(
                          width: 40,
                          height: 40,
                          decoration: BoxDecoration(
                              border: Border.all(color: Colors.grey, width: 1),
                              borderRadius: BorderRadius.circular(10),
                              gradient: LinearGradient(
                                  colors: [Colors.white24, Colors.white54])),
                          child: TextButton(
                              style: TextButton.styleFrom(),
                              onPressed: () {
                                _onClick('F');
                              },
                              child: Text(
                                'F',
                                style: TextStyle(
                                    color: Colors.black, fontSize: 18),
                              )),
                        ),
                        Container(
                          width: 40,
                          height: 40,
                          decoration: BoxDecoration(
                              border: Border.all(color: Colors.grey, width: 1),
                              borderRadius: BorderRadius.circular(10),
                              gradient: LinearGradient(
                                  colors: [Colors.white24, Colors.white54])),
                          child: TextButton(
                              style: TextButton.styleFrom(),
                              onPressed: () {
                                _onClick('G');
                              },
                              child: Text(
                                'G',
                                style: TextStyle(
                                    color: Colors.black, fontSize: 18),
                              )),
                        ),
                        Container(
                          width: 40,
                          height: 40,
                          decoration: BoxDecoration(
                              border: Border.all(color: Colors.grey, width: 1),
                              borderRadius: BorderRadius.circular(10),
                              gradient: LinearGradient(
                                  colors: [Colors.white24, Colors.white54])),
                          child: TextButton(
                              style: TextButton.styleFrom(),
                              onPressed: () {
                                _onClick('H');
                              },
                              child: Text(
                                'H',
                                style: TextStyle(
                                    color: Colors.black, fontSize: 18),
                              )),
                        ),
                        Container(
                          width: 40,
                          height: 40,
                          decoration: BoxDecoration(
                              border: Border.all(color: Colors.grey, width: 1),
                              borderRadius: BorderRadius.circular(10),
                              gradient: LinearGradient(
                                  colors: [Colors.white24, Colors.white54])),
                          child: TextButton(
                              style: TextButton.styleFrom(),
                              onPressed: () {
                                _onClick('J');
                              },
                              child: Text(
                                'J',
                                style: TextStyle(
                                    color: Colors.black, fontSize: 18),
                              )),
                        ),
                        Container(
                          width: 40,
                          height: 40,
                          decoration: BoxDecoration(
                              border: Border.all(color: Colors.grey, width: 1),
                              borderRadius: BorderRadius.circular(10),
                              gradient: LinearGradient(
                                  colors: [Colors.white24, Colors.white54])),
                          child: TextButton(
                              style: TextButton.styleFrom(),
                              onPressed: () {
                                _onClick('K');
                              },
                              child: Text(
                                'K',
                                style: TextStyle(
                                    color: Colors.black, fontSize: 18),
                              )),
                        ),
                        Container(
                          width: 40,
                          height: 40,
                          decoration: BoxDecoration(
                              border: Border.all(color: Colors.grey, width: 1),
                              borderRadius: BorderRadius.circular(10),
                              gradient: LinearGradient(
                                  colors: [Colors.white24, Colors.white54])),
                          child: TextButton(
                              style: TextButton.styleFrom(),
                              onPressed: () {
                                _onClick('L');
                              },
                              child: Text(
                                'L',
                                style: TextStyle(
                                    color: Colors.black, fontSize: 18),
                              )),
                        ),
                      ],
                    ),
                    Divider(
                      height: 10,
                      color: Colors.transparent,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        Container(
                          width: 40,
                          height: 40,
                          decoration: BoxDecoration(
                              border: Border.all(color: Colors.grey, width: 1),
                              borderRadius: BorderRadius.circular(10),
                              gradient: LinearGradient(
                                  colors: [Colors.white24, Colors.white54])),
                          child: TextButton(
                              style: TextButton.styleFrom(),
                              onPressed: () {
                                _onClick('Z');
                              },
                              child: Text(
                                'Z',
                                style: TextStyle(
                                    color: Colors.black, fontSize: 18),
                              )),
                        ),
                        Container(
                          width: 40,
                          height: 40,
                          decoration: BoxDecoration(
                              border: Border.all(color: Colors.grey, width: 1),
                              borderRadius: BorderRadius.circular(10),
                              gradient: LinearGradient(
                                  colors: [Colors.white24, Colors.white54])),
                          child: TextButton(
                              style: TextButton.styleFrom(),
                              onPressed: () {
                                _onClick('X');
                              },
                              child: Text(
                                'X',
                                style: TextStyle(
                                    color: Colors.black, fontSize: 18),
                              )),
                        ),
                        Container(
                          width: 40,
                          height: 40,
                          decoration: BoxDecoration(
                              border: Border.all(color: Colors.grey, width: 1),
                              borderRadius: BorderRadius.circular(10),
                              gradient: LinearGradient(
                                  colors: [Colors.white24, Colors.white54])),
                          child: TextButton(
                              style: TextButton.styleFrom(),
                              onPressed: () {
                                _onClick('C');
                              },
                              child: Text(
                                'C',
                                style: TextStyle(
                                    color: Colors.black, fontSize: 18),
                              )),
                        ),
                        Container(
                          width: 40,
                          height: 40,
                          decoration: BoxDecoration(
                              border: Border.all(color: Colors.grey, width: 1),
                              borderRadius: BorderRadius.circular(10),
                              gradient: LinearGradient(
                                  colors: [Colors.white24, Colors.white54])),
                          child: TextButton(
                              style: TextButton.styleFrom(),
                              onPressed: () {
                                _onClick('V');
                              },
                              child: Text(
                                'V',
                                style: TextStyle(
                                    color: Colors.black, fontSize: 18),
                              )),
                        ),
                        Container(
                          width: 40,
                          height: 40,
                          decoration: BoxDecoration(
                              border: Border.all(color: Colors.grey, width: 1),
                              borderRadius: BorderRadius.circular(10),
                              gradient: LinearGradient(
                                  colors: [Colors.white24, Colors.white54])),
                          child: TextButton(
                              style: TextButton.styleFrom(),
                              onPressed: () {
                                _onClick('B');
                              },
                              child: Text(
                                'B',
                                style: TextStyle(
                                    color: Colors.black, fontSize: 18),
                              )),
                        ),
                        Container(
                          width: 40,
                          height: 40,
                          decoration: BoxDecoration(
                              border: Border.all(color: Colors.grey, width: 1),
                              borderRadius: BorderRadius.circular(10),
                              gradient: LinearGradient(
                                  colors: [Colors.white24, Colors.white54])),
                          child: TextButton(
                              style: TextButton.styleFrom(),
                              onPressed: () {
                                _onClick('N');
                              },
                              child: Text(
                                'N',
                                style: TextStyle(
                                    color: Colors.black, fontSize: 18),
                              )),
                        ),
                        Container(
                          width: 40,
                          height: 40,
                          decoration: BoxDecoration(
                              border: Border.all(color: Colors.grey, width: 1),
                              borderRadius: BorderRadius.circular(10),
                              gradient: LinearGradient(
                                  colors: [Colors.white24, Colors.white54])),
                          child: TextButton(
                              style: TextButton.styleFrom(),
                              onPressed: () {
                                _onClick('M');
                              },
                              child: Text(
                                'M',
                                style: TextStyle(
                                    color: Colors.black, fontSize: 18),
                              )),
                        ),
                      ],
                    ),
                  ],
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}

class Letter extends StatelessWidget {
  String letter;
  bool visibility;
  Letter({required this.letter, required this.visibility});

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        Container(
          margin: EdgeInsets.symmetric(horizontal: 8),
          child: Visibility(
              visible: visibility,
              child: Text(
                letter,
                style: TextStyle(fontSize: 32),
              )),
        ),
      ],
    );
  }
}
