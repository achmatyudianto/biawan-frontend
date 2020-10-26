import 'package:animals/navigation/actionappbar.dart';
import 'package:animals/navigation/drawer.dart';
import 'package:flutter/material.dart';

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          "Beranda",
          style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
        ),
        iconTheme: new IconThemeData(color: Colors.white),
        actions: [ActionAppBar()],
      ),
      drawer: DrawerPage(),
      body: Container(
        child: Text("logout"),
      ),
    );
  }
}
