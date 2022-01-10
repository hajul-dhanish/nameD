// ignore_for_file: camel_case_types, non_constant_identifier_names

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:named/body.dart';

class settingsPage extends StatefulWidget {
  const settingsPage({Key? key}) : super(key: key);

  @override
  _settingsPageState createState() => _settingsPageState();
}

class _settingsPageState extends State<settingsPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Text("Settings"),
          centerTitle: true,
        ),
        body: Column(
          children: [
            CustomListForSettings(context),
            ListTile(
              leading: const Icon(
                Icons.light_mode,
                color: Colors.white,
              ),
              title: const Text(
                "Theme Modes",
                style: TextStyle(color: Colors.white),
              ),
              onTap: () {},
            ),
            ListTile(
              leading: const Icon(
                Icons.privacy_tip,
                color: Colors.white,
              ),
              title: const Text(
                "Privacy Policies",
                style: TextStyle(color: Colors.white),
              ),
              onTap: () {},
            ),
          ],
        ));
  }
}

Widget CustomListForSettings(
  BuildContext context,
) {
  return ListTile(
    leading: const Icon(
      Icons.vibration,
      color: Colors.white,
    ),
    title: const Text(
      "Change Vibration settings",
      style: TextStyle(color: Colors.white),
    ),
    onTap: () {
      final snackBar = SnackBar(
        content:
            const Text('Are you sure want to change the vibration setting?'),
        backgroundColor: (Colors.black12),
        action: SnackBarAction(
          label: 'Yes',
          onPressed: () {
            setState(() {
              CustomVibrate = HapticFeedback.lightImpact();
            });
          },
        ),
      );
      ScaffoldMessenger.of(context).showSnackBar(snackBar);
    },
  );
}

void setState(Null Function() param0) {}
