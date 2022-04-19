import 'package:flutter/material.dart';
import 'package:projet_mois_de_mars/quiz/note.dart';

class Resultats extends StatefulWidget {
  const Resultats({Key? key}) : super(key: key);

  @override
  State<Resultats> createState() => _ResultatsState();
}

class _ResultatsState extends State<Resultats> {
  final List<Note> noteList = [
    Note("Bravo, vous  avez obtenue une note de", "10/10")
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        color: Colors.white,
      ),
    );
  }
}
