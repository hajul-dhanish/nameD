// ignore_for_file: camel_case_types

import 'package:flutter/material.dart';
import 'package:named/drawer%20pages/settings.dart';

class customDrawer extends StatefulWidget {
  const customDrawer({Key? key}) : super(key: key);

  @override
  _customDrawerState createState() => _customDrawerState();
}

class _customDrawerState extends State<customDrawer> {
  @override
  Widget build(BuildContext context) {
    return ListView(
      children: [
        DrawerHeader(
            child: Stack(
          alignment: Alignment.bottomCenter,
          children: [
            Image.asset(
              "assets/0.5.jpg",
              fit: BoxFit.cover,
            ),
            const Text(
              "                  NameD Beta Vir-0.5a                  ",
              style: TextStyle(
                color: Colors.white,
                backgroundColor: Colors.blueGrey,
              ),
            ),
          ],
        )),
        customListTile("Updates", const Icon(Icons.update), () {
          showAlertDialog(context);
        }),
        customListTile("About US", const Icon(Icons.info), () {
          showAlertDialog(context);
        }),
        const Divider(),
        customListTile("Report Bug", const Icon(Icons.bug_report), () {
          showAlertDialog(context);
        }),
        customListTile("Settings", const Icon(Icons.settings), () {
          Navigator.push(
            context,
            MaterialPageRoute(builder: (context) => const settingsPage()),
          );
        }),
        const Divider(),
        customListTile("Contact Us", const Icon(Icons.call), () {
          showAlertDialog(context);
        }),
        customListTile("Rate Us", const Icon(Icons.star), () {
          showAlertDialog(context);
        }),
        const Divider(),
      ],
    );
  }
}

Widget customListTile(String title, Icon icon, VoidCallback onTab) {
  return ListTile(
    leading: icon,
    iconColor: Colors.white,
    title: Text(
      title,
      style: const TextStyle(color: Colors.white),
    ),
    onTap: onTab,
  );
}

showAlertDialog(
  BuildContext context,
  // String title,
  // String content,
) {
  // set up the button
  Widget okButton = TextButton(
    child: const Text(
      "Done",
      style: TextStyle(color: Colors.white),
    ),
    onPressed: () {
      Navigator.pop(context);
    },
  );

  // set up the AlertDialog
  AlertDialog alert = AlertDialog(
    backgroundColor: Colors.blueGrey,
    title: const Text(
      "Dev Working On It ..",
      style: TextStyle(color: Colors.white),
    ),
    content: const Text(
      "Update With upcoming version",
      style: TextStyle(color: Colors.white),
    ),
    actions: [
      okButton,
    ],
  );

  // show the dialog
  showDialog(
    barrierDismissible: false,
    context: context,
    builder: (BuildContext context) {
      return alert;
    },
  );
}
