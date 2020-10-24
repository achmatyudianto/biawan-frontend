import 'package:animals/auth/login.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  Future<void> _logout() async {
    SharedPreferences localStorage = await SharedPreferences.getInstance();
    localStorage.remove('token');
    Navigator.pushReplacement(
      context,
      new MaterialPageRoute(builder: (context) => LoginPage()),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          "Beranda",
          style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
        ),
        iconTheme: new IconThemeData(color: Colors.white),
      ),
      drawer: Drawer(
        child: ListView(
          padding: EdgeInsets.zero,
          children: [
            UserAccountsDrawerHeader(
              accountName: Row(
                children: [
                  Container(
                    width: 80,
                    height: 80,
                    decoration: BoxDecoration(
                      shape: BoxShape.circle,
                    ),
                    child: CircleAvatar(
                      backgroundColor: Colors.redAccent,
                      child: Icon(Icons.check),
                    ),
                  ),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      SizedBox(
                        height: 10,
                      ),
                      Text('Yudi', style: TextStyle(color: Colors.white)),
                      Text('yudi@gmail.com',
                          style: TextStyle(color: Colors.white)),
                    ],
                  )
                ],
              ),
              accountEmail: Text(''),
            ),
            ListTile(
              title: Text("Home"),
              onLongPress: () {},
            )
          ],
        ),
      ),
      body: Container(
        child: InkWell(
          onTap: () {
            _logout();
          },
          child: Text("logout"),
        ),
      ),
    );
  }
}
