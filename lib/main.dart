import 'dart:math';

import 'package:flutter/material.dart';

void main() {
  return runApp(
    MaterialApp(
      home: Scaffold(
        backgroundColor: Colors.white60,
        appBar: AppBar(
          title: Text('Dicee!'),
          backgroundColor: Colors.black45,
        ),
        body: DicePage(),
      ),
    ),
  );
}

class DicePage extends StatefulWidget {
  @override
  State<DicePage> createState() => _DicePageState();
}

class _DicePageState extends State<DicePage> {
  var leftDiceNumber = 1;
  var rightDiceNumber = 2;

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          if (leftDiceNumber == rightDiceNumber) ...[
            Padding(
              padding: EdgeInsets.all(16.0),
              child: RichText(
                textAlign: TextAlign.center,
                text: TextSpan(
                  style: TextStyle(fontWeight: FontWeight.bold, fontSize: 24),
                  children: <TextSpan>[
                    TextSpan(text: "Você ganhou! O número "),
                    TextSpan(
                        text: "$leftDiceNumber",
                        style: TextStyle(color: Colors.amber)),
                    TextSpan(text: " aparece em ambos os dados."),
                  ],
                ),
              ),
            ),
          ],
          Row(
            children: <Widget>[
              Expanded(
                child: Padding(
                  padding: const EdgeInsets.all(16),
                  child: TextButton(
                      style: TextButton.styleFrom(padding: EdgeInsets.all(0)),
                      onPressed: () {
                        setState(() {
                          leftDiceNumber = Random().nextInt(6) + 1;
                          rightDiceNumber = Random().nextInt(6) + 1;
                        });
                      },
                      child: Image.asset('images/dice$leftDiceNumber.png')),
                ),
              ),
              Expanded(
                child: Padding(
                  padding: const EdgeInsets.all(16),
                  child: TextButton(
                      style: TextButton.styleFrom(padding: EdgeInsets.zero),
                      onPressed: () {
                        setState(() {
                          rightDiceNumber = Random().nextInt(6) + 1;
                          leftDiceNumber = Random().nextInt(6) + 1;
                        });
                      },
                      child: Image.asset('images/dice$rightDiceNumber.png')),
                ),
              ),
            ],
          )
        ],
      ),
    );
  }
}
