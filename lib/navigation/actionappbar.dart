import 'dart:convert';
import 'package:animals/auth/login.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

class ActionAppBar extends StatefulWidget {
  @override
  _ActionAppBarState createState() => _ActionAppBarState();
}

class _ActionAppBarState extends State<ActionAppBar> {
  String avatarProfile =
      "https://biawan-backend.mbiodo.com/images/no-user-image.png";

  Future<void> _logout() async {
    SharedPreferences localStorage = await SharedPreferences.getInstance();
    localStorage.remove('token');
    Navigator.pushReplacement(
      context,
      new MaterialPageRoute(builder: (context) => LoginPage()),
    );
  }

  Future<void> _getProfile() async {
    SharedPreferences localStorage = await SharedPreferences.getInstance();
    final user = jsonDecode(localStorage.getString('user'));
    setState(() {
      avatarProfile = user['avatar'];
    });
  }

  @override
  void initState() {
    _getProfile();
    // TODO: implement initState
    super.initState();
  }

  void choiceAction(String choice) {
    if (choice == Constants.profile) {
      print('Wroking');
    } else if (choice == Constants.logout) {
      _logout();
    }
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(right: 15.0),
      child: PopupMenuButton<String>(
        onSelected: choiceAction,
        icon: CircleAvatar(
            radius: 30.0,
            backgroundColor: Colors.transparent,
            backgroundImage: NetworkImage(avatarProfile)),
        itemBuilder: (BuildContext context) {
          return Constants.choices.map((String choice) {
            return PopupMenuItem<String>(
              value: choice,
              child: Text(choice),
            );
          }).toList();
        },
      ),
    );
  }
}

class Constants {
  static const String profile = 'Profile';
  static const String logout = 'Keluar';

  static const List<String> choices = <String>[
    profile,
    logout,
  ];
}
