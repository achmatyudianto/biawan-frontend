import 'package:animals/navigation/actionappbar.dart';
import 'package:animals/navigation/drawer.dart';
import 'package:flutter/material.dart';

class AnimalPage extends StatefulWidget {
  @override
  _AnimalPageState createState() => _AnimalPageState();
}

class _AnimalPageState extends State<AnimalPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          "Hewan",
          style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
        ),
        iconTheme: IconThemeData(color: Colors.white),
        actions: [ActionAppBar()],
      ),
      drawer: DrawerPage(),
      body: Container(
        child: Text("Animal"),
      ),
    );
  }
}
