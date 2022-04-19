import 'dart:async';

import 'package:flutter/material.dart';
import 'package:projet_mois_de_mars/class_name/question1hist.dart';

class QuizPage extends StatefulWidget {
  const QuizPage({Key? key}) : super(key: key);

  @override
  QuizPageState createState() => QuizPageState();
}

class QuizPageState extends State<QuizPage> {
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
  final List<Question> questionsList = [
    Question("Le 7 août 1960, la Côte d'Ivoire obtient son indépendance", true),
    Question(
        "La préhistoire est une époque très ancienne qui vient après l'histoire",
        false),
    Question("Le développement d'un pays repose uniquement sur l'agriculture",
        false),
    Question("L'économie ivoirienne repose en grande partie sur l'agriculture",
        true),
    Question(
        "Les cinq pays permanents qui disposent du droit de véto sont: l'Ukraine, La Russie, La Grande-Bretagne, les Etats-Unis et la France",
        false),
    Question(
        "En Côte d'Ivoire, la pêche traditionnelle est moins pratiquée que la pêche moderne",
        false),
    Question(
        "La terre tourne autour du soleil dans un mouvement de révolution qui dure 24 heures",
        false),
    Question("L'Afrique est le berceau de l'humanité", true),
    Question("L'écriture est née en Afrique, plus précisemnet en Egypte", true),
    Question(
        "Les premiers Européens à s'installer en Côte d'Ivoire furent les français",
        true),
    Question(
        "La Ruissie et la France étaient alliées lors de la deuxième guerre mondiale",
        false),
    Question("Le travail forcé a été aboli le 11 avril 1946", true),
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
            "Histoire Et Géographie",
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
