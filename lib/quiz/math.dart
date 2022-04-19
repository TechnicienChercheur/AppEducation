import 'dart:async';

import 'package:flutter/material.dart';
import 'package:projet_mois_de_mars/class_name/question5math.dart';

class Mathematiques extends StatefulWidget {
  const Mathematiques({Key? key}) : super(key: key);

  @override
  State<Mathematiques> createState() => MathematiquesState();
}

class MathematiquesState extends State<Mathematiques> {
  late Timer timer;
  int start = 10;
  @override
  void initState() {
    startTimer();
    super.initState();
  }

  @override
  void dispose() {
    timer.cancel();
    super.dispose();
  }

  void startTimer() {
    timer = Timer.periodic(const Duration(seconds: 1), (Timer timer) {
      setState(() {
        if (start < 1) {
          _checkAnswer(null);
        } else {
          start--;
        }
      });
    });
  }

  final tickIcon = const Icon(Icons.check_circle_outline,
      color: Colors.greenAccent, size: 34);
  final crossIcon =
      const Icon(Icons.circle_outlined, color: Colors.redAccent, size: 34);
  int count = 0;
  List<Icon> iconsList = [];
  final List<Question5> questionsList = [
    Question5("Tous les angles d'un carré sont différents", false),
    Question5(
        "Le théorème de Pythagore s'applique seulement pour les carrés et les trinagles équilatérales",
        false),
    Question5(
        "Dans une suite d'opération, la multiplication est prioritaire sur l'addition et sur la soustration",
        true),
    Question5("Une demi-droite a un début  mais n'a pas de fin", true),
    Question5("Tout nombre est divisible par le chiffre 1", true),
    Question5(
        "30 possède huit (8) diviseurs qui sont: <<1, 2, 3, 5, 6, 10, 2, 30>>",
        true),
    Question5("Une figure géométrique peut avoir duex (2) côtés", true),
    Question5(
        "Dans un triangle, la somme des mesures des angles d'un triangle est égale à 190°",
        false),
    Question5("La factorisation de 4x²-20x+25 est (2x+5)²", false),
    Question5("1 est un nombre premier", false),
    Question5("6+8*3=30", true),
    Question5(
        "Deux angles supplémentaires sont deux angles dont la somme des mesures des angles est 90°",
        false),
  ];
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: Colors.white,
        appBar: AppBar(
          elevation: 0,
          backgroundColor: Colors.orange,
          title: const Text(
            "Mathématiques",
            style: TextStyle(
                color: Colors.white, fontSize: 20, fontWeight: FontWeight.w800),
          ),
          centerTitle: true,
        ),
        body: _body(),
      ),
    );
  }

  _body() {
    ///
    /// Column1
    ///
    return Container(
      color: Colors.white70,
      child: Column(
        // Divide the the vertical space between the children
        mainAxisAlignment: MainAxisAlignment.spaceBetween,

        crossAxisAlignment: CrossAxisAlignment.stretch,

        children: <Widget>[
          Center(
            child: Text(
              "$start",
              style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 35),
            ),
          ),
          Center(

              ///
              /// Text Widget with some padding
              ///
              child: Padding(
            padding:
                const EdgeInsets.only(top: 40, left: 15, right: 15, bottom: 40),
            child: Text(
              questionsList[count].question,
              style: const TextStyle(
                  color: Colors.black,
                  fontSize: 25,
                  fontWeight: FontWeight.w200),
            ),
          )),

          ///
          /// Column2
          ///
          Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: <Widget>[
              ///
              /// True Button
              ///
              Container(
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(15),
                    color: Colors.greenAccent),
                height: 100,
                width: 200,
                child: ElevatedButton(
                  style: ButtonStyle(
                    backgroundColor:
                        MaterialStateProperty.all<Color>(Colors.transparent),
                    shadowColor:
                        MaterialStateProperty.all<Color>(Colors.transparent),
                  ),
                  onPressed: () {
                    _checkAnswer(true);
                  },
                  child: const Text(
                    "Vrai",
                    style: TextStyle(fontSize: 30),
                  ),
                ),
              ),

              ///
              /// To give some space between buttons
              ///
              const SizedBox(
                height: 10,
              ),

              ///
              /// False Button
              ///
              Container(
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(15),
                    color: Colors.redAccent),
                height: 100,
                width: 200,
                child: ElevatedButton(
                  style: ButtonStyle(
                    backgroundColor:
                        MaterialStateProperty.all<Color>(Colors.transparent),
                    shadowColor:
                        MaterialStateProperty.all<Color>(Colors.transparent),
                  ),
                  onPressed: () {
                    _checkAnswer(false);
                  },
                  child: const Text(
                    "Faux",
                    style: TextStyle(fontSize: 30),
                  ),
                ),
              ),
              const SizedBox(
                height: 8,
              ),
              Container(
                color: Colors.white,
                height: 50,
                child: ListView(
                  scrollDirection: Axis.vertical,
                  children: [
                    Row(children: iconsList),
                  ],
                ),
              )
            ],
          ),
        ],
      ),
    );
  }

  _checkAnswer(selectedAnswer) {
    if (count < 12) {
      setState(() {
        iconsList.length = count;
      });
    }
    timer.cancel();
    startTimer();
    setState(() {
      start = 10;
    });
    if (selectedAnswer == questionsList[count].correctAnswer) {
      //Correct answer

      setState(() {
        iconsList.add(tickIcon);

        // Check if don't cross list size limit which will result in error
        if (count < questionsList.length - 1) count++;
      });
    } else {
      //Incorrect answer
      setState(() {
        iconsList.add(crossIcon);

        // Check if don't cross list size limit which will result in error
        if (count < questionsList.length - 1) count++;
      });
    }
  }
}
