import 'dart:async';

import 'package:flutter/material.dart';
import 'package:projet_mois_de_mars/class_name/question2cult.dart';
import 'package:rflutter_alert/rflutter_alert.dart';
// import 'package:rflutter_alert/rflutter_alert.dart';

class CultureGenerale extends StatefulWidget {
  const CultureGenerale({Key? key}) : super(key: key);

  @override
  State<CultureGenerale> createState() => CultureGeneraleState();
}

class CultureGeneraleState extends State<CultureGenerale> {
  int totalQuestions = -1;
  int totalCorrect = 0;
  late Timer timer;
  int start = 10;
  @override
  void initState() {
    startTimer();
    super.initState();
  }

  void nextQuestion() {
    if (count < questionsList.length - 1) {
      count++;
    }
  }

  @override
  void dispose() {
    timer.cancel();
    super.dispose();
  }

  void startTimer() {
    const oneSec = Duration(seconds: 1);
    timer = Timer.periodic(
      oneSec,
      (Timer timer) {
        if (count == questionsList.length) {
          setState(() {
            timer.cancel();
          });
        } else if (start == 0) {
          setState(() {
            start--;
          });
        } else {
          start = 0;
        }
      },
    );
  }

  final tickIcon = const Icon(Icons.check_circle_outline,
      color: Colors.greenAccent, size: 34);
  final crossIcon =
      const Icon(Icons.circle_outlined, color: Colors.redAccent, size: 34);
  int count = 0;
  List<Icon> iconsList = [];
  final List<Question2> questionsList = [
    Question2("La capitale économique de la Côte d'Ivoire est Abidjan", true),
    Question2("Houphouët Marie Thérèse est l'actuelle première dame ivoirienne",
        false),
    Question2(
        "Le Général Guéi Robert a été président de l'Assemblée Nationale sous Henri Konan Bedié",
        false),
    Question2(
        "La Côte d'Ivoire a remporté deux fois consécutive la Coupe d'Afrique",
        false),
    Question2(
        "Olivia Yacé est la toute première Miss ivoirienne à prendre part à MISS MONDE",
        true),
    Question2(
        "On peut avoir accès à une formation gratuite à NaN grâce au concours qu'il organise",
        true),
    Question2("Alassane Ouattara est le prédécesseur de Laurent Gbagbo", false),
    Question2(
        "En 1992, la Côte d'Ivoire organise et remporte la coupe d'Afrique",
        false),
    Question2(
        "Hamed Bakayoko est né le 8 mars 1965 et mort le 10 mars 2021", true),
    Question2(
        "Le Cameroun est le tout premier pays africain à obtenir son inépendance en 1960",
        true),
    Question2(
        "Koudou Laurent Gbagbo fut président de la Côte d'Ivoire et ancien prisonnier de la CPI",
        true),
    Question2("Bernard Dadié est un écrivain ivoirien né en 1960", false),
  ];
  bool isfinished() {
    if (count == questionsList.length - 1) {
      return true;
    } else {
      return false;
    }
  }

  void reset() {
    count = 0;
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: Colors.white,
        appBar: AppBar(
          elevation: 0,
          backgroundColor: Colors.deepOrange,
          title: const Text(
            "Culture Générale",
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
              padding: const EdgeInsets.only(
                  top: 10, left: 15, right: 15, bottom: 40),
              child: Text(
                questionsList[count].question,
                style: const TextStyle(
                    color: Colors.black,
                    fontSize: 25,
                    fontWeight: FontWeight.w200),
              ),
            ),
          ),

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
              ),
            ],
          ),
        ],
      ),
    );
  }

  void _checkAnswer(selectedAnswer) {
    totalQuestions++;

    if (count >= 11) {
      setState(() {
        Alert(
          context: context,
          type: AlertType.error,
          title: "Quiz terminé !",
          desc:
              "Vous avez eu $totalCorrect bonnes réponses sur $totalQuestions",
          buttons: [
            DialogButton(
              child: const Text(
                "Reprendre le Quiz",
                style: TextStyle(color: Colors.white, fontSize: 20),
              ),
              onPressed: () => Navigator.pop(context),
            )
          ],
        ).show();
        iconsList.clear();
      });
    }
    timer.cancel();
    startTimer();
    setState(() {
      start = 10;
    });
    if (selectedAnswer == questionsList[count].correctAnswer) {
      totalCorrect++;

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
