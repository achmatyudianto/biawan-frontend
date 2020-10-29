import 'package:flutter/material.dart';

import '../navigation/actionappbar.dart';
import '../navigation/drawer.dart';

class DashboardPage extends StatefulWidget {
  @override
  _DashboardPageState createState() => _DashboardPageState();
}

class _DashboardPageState extends State<DashboardPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          "Beranda",
          style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
        ),
        iconTheme: IconThemeData(color: Colors.white),
        actions: [ActionAppBar()],
      ),
      drawer: DrawerPage(),
      body: Container(
        child: Text("logout"),
      ),
    );
  }
}
