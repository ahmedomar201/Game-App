import 'package:flutter/material.dart';
import 'dart:math';

class FirstPage extends StatefulWidget {
  @override
  _FirstPageState createState() => _FirstPageState();
}

class _FirstPageState extends State<FirstPage> {
  int leftNumber = 2;
  int rightNumber = 1;
  String leftResult = '';
  String rightResult = '';
  List<Widget>leftList=[];
  List<Widget>rightList=[];
  int leftCounter=0;
  int rightCounter=0;

 void changecard() {
    setState(() {
      leftNumber = Random().nextInt(3) + 1;
      rightNumber = Random().nextInt(3) + 1;
      if (leftNumber == 1 && rightNumber == 2) {
        leftResult = 'winner';
        rightResult = 'loser';
        leftCounter++;



      } else if (leftNumber == 2 && rightNumber == 1) {
        leftResult = 'loser';
        rightResult = 'winner';
        rightCounter++;



      } else if (leftNumber == 1 && rightNumber == 3) {
        leftResult = 'loser';
        rightResult = 'winner';
        rightCounter++;



      } else if (leftNumber == 3 && rightNumber == 1) {
        leftResult = 'winner';
        rightResult = 'loser';
        leftCounter++;


      } else if (leftNumber == 2 && rightNumber == 3) {
        leftResult = 'winner';
        rightResult = 'loser';

      } else if (leftNumber == 3 && rightNumber == 2) {
        leftResult = 'loser';
        rightResult = 'winner';
        rightCounter++;



      } else {
        leftResult = rightResult = 'Draw';
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.white,
        body: SafeArea(
          child: SingleChildScrollView(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                Row(
                  children: [
                    Expanded(
                        child: Column(
                      children: [
                        Text(
                          (rightResult == null) ? '' : rightResult,
                          style: TextStyle(fontSize: 30, color: Colors.pink),
                        ),
                        Container(
                          height: 200,
                          margin: EdgeInsets.all(15.0),
                          child: Image.asset("images/$rightNumber.jpg"),
                          decoration: BoxDecoration(
                              border: Border.all(color: Colors.red)),
                        ),



                      ],
                    )),
                    Expanded(
                        child: Column(
                      children: [
                        Text((leftResult == null) ? '' : leftResult,
                            style: TextStyle(fontSize: 30, color: Colors.pink)),
                        Container(
                          height: 200,
                          margin: EdgeInsets.all(15.0),
                          child: Image.asset("images/$leftNumber.jpg"),
                          decoration: BoxDecoration(
                              border: Border.all(color: Colors.red)),
                        ),


                      ],
                    )),
                  ],
                ),
                MaterialButton(
                  color: Colors.teal,
                  onPressed: () {
                    changecard();
                  },
                  child: Text(
                    "play",
                    style: TextStyle(fontSize: 25, color: Colors.white),
                  ),),
                MaterialButton(
                  padding: EdgeInsets.all(15),
                  color: Colors.red,
                  onPressed: () {
                    setState(() {
                      leftResult=rightResult=null;
                      leftList=rightList=[];
                      //leftList.clear();او
                      //leftList.clear();
                      leftCounter=rightCounter=0;

                    });
                    
                  },
                  child: Text(
                    "finish",
                    style: TextStyle(fontSize: 25, color: Colors.white),
                  ),),


              ],
            ),
          ),
        ));
  }
}
