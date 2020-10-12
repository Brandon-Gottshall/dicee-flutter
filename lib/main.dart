import 'package:flutter/material.dart';
import 'dart:math' show Random;

void main() {
  return runApp(
    MaterialApp(
      home: Scaffold(
        backgroundColor: Colors.red,
        appBar: AppBar(
          title: Text('Dicee'),
          backgroundColor: Colors.red,
        ),
        body: DicePage(),
      ),
    ),
  );
}

class DicePage extends StatefulWidget {
  @override
  _DicePageState createState() => _DicePageState();
}

class _DicePageState extends State<DicePage> {
  int leftDiceNumber,
      leftDiceNumberLast,
      rightDiceNumber,
      rightDiceNumberLast,
      nextDiceNumber;
  @override
  Widget initState() {
    leftDiceNumber = roll('left');
    rightDiceNumber = roll('right');
  }

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              Expanded(
                  child: FlatButton(
                      onPressed: () {
                        setState(() {
                          rollState('left');
                        });
                      },
                      child: Image(
                          image:
                              AssetImage('images/dice$leftDiceNumber.png')))),
              Expanded(
                  child: FlatButton(
                      onPressed: () {
                        setState(() {
                          rollState('right');
                        });
                      },
                      child: Image(
                          image:
                              AssetImage('images/dice$rightDiceNumber.png'))))
            ],
          ),
          SizedBox(height: 150),
          Container(
            width: double.infinity,
            height: 70,
            padding: EdgeInsets.fromLTRB(50, 0, 50, 0),
            child: RaisedButton(
                color: Colors.white,
                elevation: 1,
                onPressed: () {
                  setState(() {
                    rollState('right');
                    rollState('left');
                  });
                },
                child: Center(
                    child: Text(
                  'Roll',
                  style: TextStyle(fontSize: 34, color: Colors.red),
                ))),
          )
        ],
      ),
    );
  }

  void rollState(String leftOrRightDie) {
    var rng = new Random();
    int randInt = rng.nextInt(6) + 1;
    if (leftOrRightDie == 'left') {
      while (randInt == leftDiceNumberLast || randInt == leftDiceNumber) {
        randInt = rng.nextInt(6) + 1;
      }
      leftDiceNumberLast = leftDiceNumber;
      leftDiceNumber = randInt;
    } else if (leftOrRightDie == 'right') {
      while (randInt == rightDiceNumberLast || randInt == rightDiceNumber) {
        randInt = rng.nextInt(6) + 1;
      }
      rightDiceNumberLast = rightDiceNumber;
      rightDiceNumber = randInt;
      print('dicenumber = $rightDiceNumber');
    }
  }

  int roll(leftOrRightDie) {
    var rng = new Random();
    int randInt = rng.nextInt(6) + 1;
    switch (leftOrRightDie) {
      case 'left':
        while (randInt == leftDiceNumberLast || randInt == leftDiceNumber) {
          randInt = rng.nextInt(6) + 1;
        }
        break;
      case 'right':
        while (randInt == rightDiceNumberLast || randInt == rightDiceNumber) {
          randInt = rng.nextInt(6) + 1;
        }
        break;
    }
    print('dicenumber = $randInt');
    return randInt;
  }
}
