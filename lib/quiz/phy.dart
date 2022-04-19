import 'dart:async';

import 'package:flutter/material.dart';
import 'package:projet_mois_de_mars/class_name/question6phy.dart';

class Philosophie extends StatefulWidget {
  const Philosophie({Key? key}) : super(key: key);

  @override
  State<Philosophie> createState() => PhilosophieState();
}

class PhilosophieState extends State<Philosophie> {
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
  final List<Question6> questionsList = [
    Question6(
        "Pour Machiavel, les deux qualités d'un bon chef d'Etat sont la force et la ruse",
        true),
    Question6(
        "Nietzsche caractérise l'Etat comme <<le plus froid de tous les monstres froids",
        true),
    Question6("L'anarchie, c'est le chaos social", false),
    Question6(
        "L'auteur de la citation: <<L'homme est un loup pour l'homme>> est Thomas Hobbes",
        true),
    Question6("Thomas Hobbes est un philosophe américain.", false),
    Question6("Chez Levinas, autrui est synonyme de violence ", false),
    Question6(
        "Une société atomisée est une société dans laquelle les individus sont isolés les uns des autres",
        true),
    Question6(
        "L'agnosticisme est le fait de croire qu'aucune vérité absolue n'est accessible",
        true),
    Question6(
        "La phrase :« Crois, et tu comprendras » est de Saint Thomas", false),
    Question6(
        "Le déisme c'est le fait de croire en l'existence de Dieu mais pas en ses représentants.",
        true),
    Question6(
        "Le doute de Descartes peut-être caractérisé de méthodique", true),
    Question6(
        " <<Science sans conscience n'est que ruine de l'âme>> est une citation de Jean Paul Sartre",
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
            "Pilosophie",
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
                const EdgeInsets.only(top: 40, left: 15, right: 15, bottom: 15),
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
