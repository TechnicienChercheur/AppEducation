import 'package:flutter/material.dart';
import 'package:projet_mois_de_mars/quiz/culturegene.dart';
import 'package:projet_mois_de_mars/quiz/fran.dart';
import 'package:projet_mois_de_mars/quiz/histoire.dart';
import 'package:projet_mois_de_mars/quiz/info.dart';
import 'package:projet_mois_de_mars/quiz/math.dart';
import 'package:projet_mois_de_mars/quiz/phy.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        actions: <Widget>[
          IconButton(
            onPressed: () {},
            icon: const Icon(Icons.share),
          )
        ],
        elevation: 0.0,
        backgroundColor: Colors.deepOrange,
        centerTitle: true,
        title: const Text(
          "Le Bosseur",
          style: TextStyle(
              color: Colors.white, fontWeight: FontWeight.bold, fontSize: 30),
        ),
      ),
      body: SingleChildScrollView(
        child: SafeArea(
          child: Container(
            padding: const EdgeInsets.only(
              top: 15.0,
              bottom: 30.0,
              right: 7.0,
              left: 7.0,
            ),
            child: Column(
              // mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                // const Text(
                //   "Entraîne-toi avec nos Quiz et deviens meilleur",
                //   textAlign: TextAlign.start,
                //   style: TextStyle(
                //     fontSize: 23.0,
                //     color: Colors.black,
                //     fontWeight: FontWeight.w800,
                //   ),
                // ),
                const SizedBox(height: 40),
                InkWell(
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => const CultureGenerale()),
                    );
                  },
                  child: Container(
                    height: 90,
                    width: MediaQuery.of(context).size.width,
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(15.0),
                        color: const Color.fromARGB(255, 228, 97, 57)),
                    child: const Center(
                      child: Text(
                        "Culture Générale",
                        style: TextStyle(
                            fontSize: 27.0,
                            color: Colors.white,
                            fontWeight: FontWeight.w400),
                      ),
                    ),
                  ),
                ),
                const SizedBox(height: 15),
                InkWell(
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => const Litterature()),
                    );
                  },
                  child: Container(
                    height: 90,
                    width: MediaQuery.of(context).size.width,
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(15.0),
                        color: Colors.orangeAccent),
                    child: const Center(
                      child: Text(
                        "Français",
                        style: TextStyle(
                            fontSize: 27.0,
                            color: Colors.white,
                            fontWeight: FontWeight.w400),
                      ),
                    ),
                  ),
                ),
                const SizedBox(height: 15),
                InkWell(
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => const QuizPage()),
                    );
                  },
                  child: Container(
                    height: 90,
                    width: MediaQuery.of(context).size.width,
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(15.0),
                        color: const Color.fromARGB(211, 192, 114, 12)),
                    child: const Center(
                      child: Text(
                        "Histoire",
                        style: TextStyle(
                            fontSize: 27.0,
                            color: Colors.white,
                            fontWeight: FontWeight.w400),
                      ),
                    ),
                  ),
                ),
                const SizedBox(height: 15),
                InkWell(
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => const Informatique()),
                    );
                  },
                  child: Container(
                    height: 90,
                    width: MediaQuery.of(context).size.width,
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(15.0),
                        color: const Color.fromARGB(255, 255, 140, 64)),
                    child: const Center(
                      child: Text(
                        "Informatique",
                        style: TextStyle(
                            fontSize: 27.0,
                            color: Colors.white,
                            fontWeight: FontWeight.w400),
                      ),
                    ),
                  ),
                ),
                const SizedBox(height: 15),
                InkWell(
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => const Mathematiques()),
                    );
                  },
                  child: Container(
                    height: 90,
                    width: MediaQuery.of(context).size.width,
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(15.0),
                        color: const Color.fromARGB(255, 255, 217, 0)),
                    child: const Center(
                      child: Text(
                        "Mathématiques",
                        style: TextStyle(
                            fontSize: 27.0,
                            color: Colors.white,
                            fontWeight: FontWeight.w400),
                      ),
                    ),
                  ),
                ),
                const SizedBox(height: 15),
                InkWell(
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => const Philosophie()),
                    );
                  },
                  child: Container(
                    height: 90,
                    width: MediaQuery.of(context).size.width,
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(15.0),
                        color: const Color.fromARGB(88, 255, 153, 0)),
                    child: const Center(
                      child: Text(
                        "Philosophie",
                        style: TextStyle(
                            fontSize: 27.0,
                            color: Colors.white,
                            fontWeight: FontWeight.w400),
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
      bottomNavigationBar: BottomNavigationBar(
        items: const [
          BottomNavigationBarItem(icon: Icon(Icons.note), label: "Note"),
          BottomNavigationBarItem(icon: Icon(Icons.person), label: "profil"),
        ],
      ),
      drawer: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          Container(
            height: 450,
            width: MediaQuery.of(context).size.width / 1.6,
            child: Drawer(
              child: ListView(
                padding: EdgeInsets.zero,
                children: [
                  const DrawerHeader(
                    decoration: BoxDecoration(),
                    child: Text(
                      "Le Bosseur",
                      style: TextStyle(color: Colors.black, fontSize: 25),
                    ),
                  ),
                  ListTile(
                    leading: const Icon(Icons.settings, size: 28),
                    title: const Text(
                      "Paramètre",
                      style: TextStyle(fontSize: 18),
                    ),
                    onTap: () {
                      Navigator.pop(context);
                    },
                  ),
                  const ListTile(
                    leading: Icon(Icons.settings, size: 28),
                    title: Text(
                      "Contactez-nous",
                      style: TextStyle(fontSize: 18),
                    ),
                  ),
                  const ListTile(
                    leading: Icon(Icons.settings, size: 28),
                    title: Text(
                      "Avant propos",
                      style: TextStyle(fontSize: 18),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
