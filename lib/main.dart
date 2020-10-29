import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

import 'auth/login.dart';
import 'animal/dashboard.dart';

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
          primaryColor: Color(0xFF76a6ef),
          fontFamily: 'ProximaNova',
          primaryTextTheme: TextTheme(
              headline6: TextStyle(
            color: Colors.white,
          ))),
      debugShowCheckedModeBanner: false,
      home: FutureBuilder(
        future: _function(),
        builder: (BuildContext context, AsyncSnapshot<bool> snapshot) {
          //print(snapshot.data);
          if (snapshot.data == true) {
            return DashboardPage();
          } else if (snapshot.data == false) {
            return LoginPage();
          } else {
            return Scaffold(
              body: Container(child: Center(child: _title())),
            );
          }
        },
      ),
      // initialRoute: '/',
      // routes: {
      //   '/': (context) => DashboardPage(),
      //   '/cage': (context) => CagePage(),
      //   '/animal': (context) => AnimalPage(),
      // },
    );
  }
}
