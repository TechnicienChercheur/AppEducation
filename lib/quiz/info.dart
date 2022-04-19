import 'dart:async';

import 'package:flutter/material.dart';
import 'package:projet_mois_de_mars/class_name/question4info.dart';

class Informatique extends StatefulWidget {
  const Informatique({Key? key}) : super(key: key);

  @override
  State<Informatique> createState() => InformatiqueState();
}

class InformatiqueState extends State<Informatique> {
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
  final List<Question4> questionsList = [
    Question4("Flutter est un sdk créé par google", true),
    Question4(
        "La première version de flutter était connue sous le nom de code <<Sky>>",
        true),
    Question4("HTML signifie <<HyperText Mobile Language>>", false),
    Question4(
        " HTML est un langage de balisage conçu pour représenter les pages web",
        true),
    Question4(
        "PhP et JavaScript sont les deux langages de programmation", false),
    Question4(
        "Flutter a été dévoilé en 2012 lors du sommet des développeurs dart",
        false),
    Question4("Le langage de programmation utilisé par flutter est C++", true),
    Question4("CSS est l'abréviation de Cascading Style Sheets", true),
    Question4("Sans la carte mère, un ordinateur peut correctement fonctionner",
        false),
    Question4(
        "Le clavier est une interface Homme-Marchine permettant à l'utilisateur de communniquer avec l'ordinateur",
        false),
    Question4("Les widgets Column et Row prennnent plusieurs enfants", true),
    Question4("Le concepteur de html5 est Tim Berners-Lee", true),
  ];
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: Colors.white,
        appBar: AppBar(
          elevation: 0,
          backgroundColor: Colors.deepOrange,
          title: const Text(
            "Informatique",
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
