import 'dart:convert';
import 'package:animals/main.dart';
import 'package:animals/model/api.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:shared_preferences/shared_preferences.dart';

class RegisterPage extends StatefulWidget {
  @override
  _RegisterPageState createState() => _RegisterPageState();
}

class _RegisterPageState extends State<RegisterPage> {
  TextEditingController companyController = TextEditingController();
  TextEditingController nameController = TextEditingController();
  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  TextEditingController passwordConfirmationController =
      TextEditingController();

  bool isLoading = false;

  Future<void> _blockir() {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: Text("Comming Soon"),
          actions: [
            FlatButton(
              child: Text("OK"),
              onPressed: () {
                Navigator.of(context).pop();
              },
            ),
          ],
        );
      },
    );
  }

  Future<void> _register() async {
    setState(() {
      isLoading = true;
    });

    var data = {
      'company_name': companyController.text,
      'name': nameController.text,
      'email': emailController.text,
      'password': passwordController.text,
      'password_confirmation': passwordConfirmationController.text
    };

    var res = await CallApi().postData(data, 'auth/register');
    var body = json.decode(res.body);
    if (body['data'] != null) {
      print(body);
      SharedPreferences localStorage = await SharedPreferences.getInstance();
      localStorage.setString('token', body['meta']['token']);
      localStorage.setString('user', json.encode(body['data']));

      Navigator.pushReplacement(
          context, new MaterialPageRoute(builder: (context) => MyApp()));
    } else {
      print(body);
      var errorMessage = '';
      if (body['errors']['company_name'] != null) {
        errorMessage = body['errors']['company_name'][0];
      } else if (body['errors']['name'] != null) {
        errorMessage = body['errors']['name'][0];
      } else if (body['errors']['email'] != null) {
        errorMessage = body['errors']['email'][0];
      } else if (body['errors']['password'] != null) {
        errorMessage = body['errors']['password'][0];
      } else {
        errorMessage = body['message'];
      }
      print('errorMessage : $errorMessage');
      showDialog(
        context: context,
        builder: (BuildContext context) {
          return AlertDialog(
            title: Text(
              errorMessage,
              style: TextStyle(fontSize: 14.0),
            ),
            actions: <Widget>[
              FlatButton(
                child: new Text('OK'),
                onPressed: () {
                  Navigator.of(context).pop();
                },
              ),
            ],
          );
        },
      );
    }

    setState(() {
      isLoading = false;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Container(
          height: MediaQuery.of(context).size.height,
          width: MediaQuery.of(context).size.width,
          color: Color(0xFFf5f8ff),
          // decoration: BoxDecoration(
          //   gradient: LinearGradient(
          //     begin: Alignment.topLeft,
          //     end: Alignment.bottomRight,
          //     colors: [
          //       Color(0xFF8A2387),
          //       Color(0xFFE94097),
          //       Color(0xFFF27121),
          //     ],
          //   ),
          // ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              SizedBox(height: 30),
              Container(
                height: 585,
                width: 325,
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(10),
                  boxShadow: [
                    BoxShadow(
                      blurRadius: 10.0,
                      color: Colors.grey.shade200,
                      spreadRadius: 2.0,
                    )
                  ],
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    SizedBox(height: 20.0),
                    Image(
                      image: AssetImage("biawan.png"),
                      width: 80.0,
                    ),
                    SizedBox(height: 10.0),
                    Text(
                      'Biawan',
                      style: TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.bold,
                        color: Colors.brown,
                      ),
                    ),
                    SizedBox(height: 20.0),
                    Container(
                      width: 250,
                      child: TextField(
                        controller: companyController,
                        decoration: InputDecoration(
                          labelText: 'Nama Perusahaan',
                          suffixIcon: Icon(
                            FontAwesomeIcons.building,
                            size: 17,
                          ),
                        ),
                      ),
                    ),
                    Container(
                      width: 250,
                      child: TextField(
                        controller: nameController,
                        decoration: InputDecoration(
                          labelText: 'Nama Pengguna',
                          suffixIcon: Icon(
                            FontAwesomeIcons.user,
                            size: 17,
                          ),
                        ),
                      ),
                    ),
                    Container(
                      width: 250,
                      child: TextField(
                        controller: emailController,
                        decoration: InputDecoration(
                          labelText: 'Email',
                          suffixIcon: Icon(
                            FontAwesomeIcons.envelope,
                            size: 17,
                          ),
                        ),
                      ),
                    ),
                    Container(
                      width: 250,
                      child: TextField(
                        controller: passwordController,
                        obscureText: true,
                        decoration: InputDecoration(
                          labelText: 'Kata Sandi',
                          suffixIcon: Icon(
                            FontAwesomeIcons.eyeSlash,
                            size: 17,
                          ),
                        ),
                      ),
                    ),
                    Container(
                      width: 250,
                      child: TextField(
                        controller: passwordConfirmationController,
                        obscureText: true,
                        decoration: InputDecoration(
                          labelText: 'Konfirmasi Kata Sandi',
                          suffixIcon: Icon(
                            FontAwesomeIcons.eyeSlash,
                            size: 17,
                          ),
                        ),
                      ),
                    ),
                    SizedBox(height: 20.0),
                    InkWell(
                      onTap: () {
                        //_register();
                        _blockir();
                      },
                      child: Container(
                        alignment: Alignment.center,
                        width: 250,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(50.0),
                          color: Color(0xFF76a6ef),
                          // gradient: LinearGradient(
                          //   begin: Alignment.centerLeft,
                          //   end: Alignment.centerRight,
                          //   colors: [
                          //     Color(0xFF8A2387),
                          //     Color(0xFFE94057),
                          //     Color(0xFFF27121),
                          //   ],
                          // ),
                        ),
                        child: Padding(
                          padding: EdgeInsets.all(12.0),
                          child: Text(
                            isLoading ? 'Memuat...' : 'Daftar',
                            style: TextStyle(
                              color: Colors.white,
                              fontWeight: FontWeight.bold,
                              fontSize: 15.0,
                            ),
                          ),
                        ),
                      ),
                    ),
                    Padding(
                      padding: EdgeInsets.fromLTRB(20, 20, 40, 20),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.end,
                        children: [
                          Text(
                            'Sudah Punya Akun? ',
                            style: TextStyle(
                              color: Colors.grey.shade700,
                            ),
                          ),
                          InkWell(
                            onTap: () {
                              Navigator.pop(context);
                            },
                            child: Text(
                              'Masuk',
                              style: TextStyle(
                                color: Colors.red.shade300,
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
              SizedBox(height: 20),
            ],
          ),
        ),
      ),
    );
  }
}
