import 'package:animals/navigation/actionappbar.dart';
import 'package:animals/navigation/drawer.dart';
import 'package:flutter/material.dart';

class CagePage extends StatefulWidget {
  @override
  _CagePageState createState() => _CagePageState();
}

class _CagePageState extends State<CagePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Kandang",
            style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold)),
        iconTheme: IconThemeData(color: Colors.white),
        actions: [ActionAppBar()],
      ),
      drawer: DrawerPage(),
      body: Container(
        child: Text("Kandang"),
      ),
    );
  }
}
