import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'animal/home.dart';
import 'auth/login.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatefulWidget {
  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  Future<bool> _function() async {
    SharedPreferences localStorage = await SharedPreferences.getInstance();
    var token = localStorage.getString('token');
    if (token != null) {
      return true;
    } else {
      return false;
    }
  }

  Widget _title() {
    return RichText(
      textAlign: TextAlign.center,
      text: TextSpan(
        text: 'Animal',
        style: TextStyle(color: Colors.purple, fontSize: 30),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(
        primaryColor: Colors.purple,
      ),
      debugShowCheckedModeBanner: false,
      home: FutureBuilder(
        future: _function(),
        builder: (BuildContext context, AsyncSnapshot<bool> snapshot) {
          //print(snapshot.data);
          if (snapshot.data == true) {
            return HomePage();
          } else if (snapshot.data == false) {
            return LoginPage();
          } else {
            return Scaffold(
              body: Container(child: Center(child: _title())),
            );
          }
        },
      ),
    );
  }
}