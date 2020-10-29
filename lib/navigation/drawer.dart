import 'dart:convert';
import 'package:animals/animal/animal.dart';
import 'package:animals/animal/cage.dart';
import 'package:animals/animal/dashboard.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:shared_preferences/shared_preferences.dart';

class DrawerPage extends StatefulWidget {
  @override
  _DrawerPageState createState() => _DrawerPageState();
}

class _DrawerPageState extends State<DrawerPage> {
  String emailProfile = "",
      nameProfile = "",
      avatarProfile =
          "https://biawan-backend.mbiodo.com/images/no-user-image.png";

  Future<void> _getProfile() async {
    SharedPreferences localStorage = await SharedPreferences.getInstance();
    final user = jsonDecode(localStorage.getString('user'));
    setState(() {
      emailProfile = user['email'];
      nameProfile = user['name'];
      avatarProfile = user['avatar'];
    });
  }

  @override
  void initState() {
    _getProfile();
    // TODO: implement initState
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: ListView(
        padding: EdgeInsets.zero,
        children: [
          UserAccountsDrawerHeader(
            accountName: Text(
              nameProfile,
              style: TextStyle(
                color: Colors.white,
                fontWeight: FontWeight.bold,
              ),
            ),
            accountEmail: Text(
              emailProfile,
              style: TextStyle(
                color: Colors.white,
                fontWeight: FontWeight.bold,
              ),
            ),
            currentAccountPicture: CircleAvatar(
              backgroundImage: NetworkImage(avatarProfile),
              backgroundColor: Colors.transparent,
              radius: 30,
            ),
          ),
          ListTile(
              leading: Icon(
                FontAwesomeIcons.home,
              ),
              title: Text("Beranda"),
              trailing: Icon(Icons.arrow_right),
              onTap: () {
                Navigator.pushReplacement(context,
                    MaterialPageRoute(builder: (context) => DashboardPage()));
              }),
          ListTile(
            leading: Icon(FontAwesomeIcons.dungeon),
            title: Text("Kandang"),
            trailing: Icon(Icons.arrow_right),
            onTap: () {
              Navigator.pushReplacement(
                  context, MaterialPageRoute(builder: (context) => CagePage()));
            },
          ),
          ListTile(
            leading: Icon(FontAwesomeIcons.dog),
            title: Text("Hewan"),
            trailing: Icon(Icons.arrow_right),
            onTap: () {
              Navigator.pushReplacement(context,
                  MaterialPageRoute(builder: (context) => AnimalPage()));
            },
          ),
          ListTile(
            leading: Icon(Icons.supervised_user_circle),
            title: Text("Pengaturan Pengguna"),
            trailing: Icon(Icons.arrow_right),
          )
        ],
      ),
    );
  }
}
