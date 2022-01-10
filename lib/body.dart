// ignore_for_file: camel_case_types

import 'package:flutter/material.dart';
import 'package:english_words/english_words.dart';
import 'package:flutter/services.dart';
import 'package:named/drawer.dart';

class myApp extends StatefulWidget {
  const myApp({Key? key}) : super(key: key);

  @override
  _myAppState createState() => _myAppState();
}

var CustomVibrate = HapticFeedback.heavyImpact();
final wordPair = WordPair.random();

class customWords {
  static String customWordPair = wordPair.asPascalCase;
}

class _myAppState extends State<myApp> {
  @override
  Widget build(BuildContext context) {
    final wordPair = WordPair.random();
    return MaterialApp(
      theme: ThemeData(
          scaffoldBackgroundColor: Colors.blueGrey[700],
          // backgroundColor: Colors.black12,
          primaryColor: Colors.blue,
          bottomAppBarTheme: const BottomAppBarTheme(color: Colors.blueGrey),
          drawerTheme: const DrawerThemeData(backgroundColor: Colors.blueGrey)),
      debugShowCheckedModeBanner: false,
      title: "NameD",
      home: Scaffold(
        drawer: const Drawer(
          child: customDrawer(),
        ),
        appBar: AppBar(
          backgroundColor: Colors.transparent,
          elevation: 0,
          title: Column(
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: const [
                  Text("Name"),
                  Text(
                    "D",
                    style: TextStyle(color: Colors.lightGreen),
                  )
                ],
              ),
              const SizedBox(height: 5),
              const Text(
                "Random Word for Random People",
                style: TextStyle(fontSize: 11, color: Colors.grey),
              )
            ],
          ),
          centerTitle: true,
        ),
        extendBodyBehindAppBar: false,
        body: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Column(
              children: [
                Text(
                  '"${customWords.customWordPair}"',
                  style:
                      const TextStyle(fontSize: 30, color: Colors.lightGreen),
                ),
                const SizedBox(
                  height: 10,
                ),
                customButton("Next Random Full Name", () {
                  setState(() {
                    customWords.customWordPair =
                        wordPair.asPascalCase.toUpperCase();
                  });
                }),
                const SizedBox(
                  height: 10,
                ),
                const Divider(
                  color: Colors.white,
                  indent: 100,
                  endIndent: 100,
                ),
                const Text(
                  "Text Style,",
                  style: TextStyle(color: Colors.white),
                ),
                const SizedBox(
                  height: 10,
                ),
                customButton("First Name Only", () {
                  CustomVibrate;
                  setState(() {
                    customWords.customWordPair = wordPair.first.toUpperCase();
                  });
                }),
                const SizedBox(
                  height: 10,
                ),
                customButton("Second Name Only", () {
                  CustomVibrate;
                  setState(() {
                    customWords.customWordPair = wordPair.second.toUpperCase();
                  });
                }),
                const SizedBox(
                  height: 10,
                ),
                customButton("As Snake Case Name", () {
                  CustomVibrate;
                  setState(() {
                    HapticFeedback.heavyImpact();
                    wordPair.asSnakeCase.toUpperCase();
                  });
                }),
              ],
            ),
          ],
        ),
        bottomNavigationBar: BottomAppBar(
          child: Container(
            margin: const EdgeInsets.all(10),
            child: const Text(
              "This Random names must be non-Licensed and free to use for commercial purpose,"
              " But We always wanted you to make sure that the choosen name is available for commercial use"
              "\n"
              "\n"
              "Complete App Features will implement with stable version...",
              style: TextStyle(fontSize: 12, color: Colors.white),
              textAlign: TextAlign.justify,
            ),
          ),
        ),
      ),
    );
  }
}

Widget customButton(String name, VoidCallback ontab) {
  return ElevatedButton(
      style: ButtonStyle(
        backgroundColor: MaterialStateProperty.all(Colors.amber),
      ),
      onPressed: ontab,
      child: Text(
        name,
        style: const TextStyle(color: Colors.black),
      ));
}
