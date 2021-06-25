import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'dart:async';
import 'dart:convert';
import 'package:http/http.dart' as http;

import './homepage.dart';

String username = '';

class LoginPage extends StatefulWidget {
  LoginPage({Key key, this.title}) : super(key: key);

  final String title;

  @override
  _LoginPageState createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  TextEditingController user = new TextEditingController();
  TextEditingController pass = new TextEditingController();

  String msg = '';

  Future<List> _proseslogin() async {
    final response =
        await http.post("http://127.0.0.1/flutter/proses_login.php", body: {
      "username": user.text,
      "password": pass.text,
    });
    var dataadmin = json.decode(response.body);

    if (dataadmin.length == 1) {
      Navigator.push(
          context,
          MaterialPageRoute(
              builder: (context) => HomePage(username: username)));
      setState(() {
        username = dataadmin[0]['username'];
      });
    } else {
      setState(() {
        msg = "Login Gagal";
      });
    }
    return dataadmin;
  }

  @override
  Widget build(BuildContext context) {
    SystemChrome.setSystemUIOverlayStyle(SystemUiOverlayStyle(
      statusBarColor: Colors.transparent, // status bar color
    ));
    return Scaffold(
        body: SingleChildScrollView(
            child: Container(
      height: MediaQuery.of(context).size.height,
      child: Stack(
        children: <Widget>[
          Container(
            padding: EdgeInsets.symmetric(horizontal: 20),
            decoration: BoxDecoration(
                gradient: LinearGradient(
                    begin: Alignment.topCenter,
                    end: Alignment.bottomCenter,
                    colors: [Colors.white, Colors.white])),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  mainAxisAlignment: MainAxisAlignment.center,
                ),
                Container(
                  margin: EdgeInsets.symmetric(vertical: 10),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: <Widget>[
                      new Center(
                        child: new Image.asset(
                          "assets/logo.png",
                          height: 200.0,
                          width: 200.0,
                        ),
                      ),
                      Text(
                        'Username',
                        style: TextStyle(
                            fontWeight: FontWeight.bold, fontSize: 16),
                      ),
                      SizedBox(
                        height: 10,
                      ),
                      TextField(
                          controller: user..text = 'mrmoney',
                          style: TextStyle(fontSize: 18),
                          obscureText: false,
                          decoration: InputDecoration(
                              icon: Icon(Icons.people),
                              border: InputBorder.none,
                              fillColor: Color(0xfff3f3f4),
                              filled: true))
                    ],
                  ),
                ),
                Container(
                  margin: EdgeInsets.symmetric(vertical: 10),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: <Widget>[
                      Text(
                        'Password',
                        style: TextStyle(
                            fontWeight: FontWeight.bold, fontSize: 16),
                      ),
                      SizedBox(
                        height: 10,
                      ),
                      TextField(
                          controller: pass..text = '12345',
                          style: TextStyle(fontSize: 18),
                          obscureText: true,
                          decoration: InputDecoration(
                              icon: Icon(Icons.vpn_key),
                              border: InputBorder.none,
                              fillColor: Color(0xfff3f3f4),
                              filled: true)),
                      Container(
                          child: Row(
                        children: [
                          Checkbox(
                            value: true,
                            onChanged: (value) {},
                          ),
                          Text(
                            "Remember Me",
                            style: TextStyle(fontSize: 18, color: Colors.black),
                          ),
                        ],
                      ))
                    ],
                  ),
                ),
                SizedBox(
                  height: 20,
                ),
                Text(
                  msg,
                  style: TextStyle(fontSize: 15.0, color: Colors.red),
                ),
                TextButton(
                  child: Container(
                    width: MediaQuery.of(context).size.width,
                    padding: EdgeInsets.symmetric(vertical: 15),
                    alignment: Alignment.center,
                    decoration: BoxDecoration(
                        boxShadow: <BoxShadow>[
                          BoxShadow(
                              color: Colors.grey.shade200,
                              offset: Offset(2, 4),
                              blurRadius: 5,
                              spreadRadius: 2)
                        ],
                        borderRadius: BorderRadius.all(Radius.circular(5)),
                        gradient: LinearGradient(
                            begin: Alignment.centerLeft,
                            end: Alignment.centerRight,
                            colors: [Colors.orange[500], Colors.orange[500]])),
                    child: Text(
                      'Login',
                      style: TextStyle(fontSize: 20, color: Colors.white),
                    ),
                  ),
                  onPressed: () {
                    _proseslogin();
                  },
                ),
                Expanded(
                  flex: 1,
                  child: SizedBox(),
                ),
              ],
            ),
          ),
        ],
      ),
    )));
  }
}
