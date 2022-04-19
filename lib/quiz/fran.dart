import 'dart:async';

import 'package:flutter/material.dart';
import 'package:projet_mois_de_mars/class_name/question3litte.dart';

class Litterature extends StatefulWidget {
  const Litterature({Key? key}) : super(key: key);

  @override
  State<Litterature> createState() => LitteratureState();
}

class LitteratureState extends State<Litterature> {
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
  final List<Question3> questionsList = [
    Question3(
        "Le verbe ALLER est un verbe du 1er groupe. Car il se termine par <<er>>",
        false),
    Question3("EMINENT et IMMINENT sont des antonymes", false),
    Question3(
        "Le participe passé employé avec l'auxiliaire avoir s'accorde en genre et en nombre avec le COD qui le précède",
        true),
    Question3(
        "La phrase <<Les conseils que mon père m'a donnés ont fait de moi un sage>> ne contient pas de fautes",
        true),
    Question3(
        "La dissertation littéraire comprend quatre parties qui sont: l'introduction, le développement, la conclusion, et l'ouverture",
        false),
    Question3(
        "Le mot <<Enjailler>> qui veut dire séduire, ambiancer, est d'origine ivoirienne",
        true),
    Question3(
        "L'introduction d'un texte argumentatif passe par une généralité autour du sujet, l'insertion du sujet et l'annonce du plan",
        true),
    Question3(
        "L'ouverture est indispensable dans un sujet de dissertation littéraire",
        false),
    Question3(
        "Une oeuvre écrite sous la forme d'une lettre est appelée oeuvre autobiographique",
        false),
    Question3(
        "Les quatre (4) principaux temps du récit sont: le présent, le passé simple, l'imparfait et le passé composé",
        true),
    Question3(
        "Le mode indicatif comprend huit temps dont quatre temps simples et quatre temps composés",
        true),
    Question3(
        "L'impératif n'est pas un mode de la conjuguaison en française", false),
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
            "Français",
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
