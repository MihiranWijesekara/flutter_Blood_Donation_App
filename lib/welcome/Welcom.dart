import 'dart:convert';

import 'package:flutter_application_1/authentication/login/login.dart';
import 'package:flutter_application_1/controller/firebase/auth/FirebaseAuthService.dart';
import 'package:flutter_application_1/models/album.dart';
import 'package:flutter/material.dart';
import 'package:flutter_application_1/models/album.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:http/http.dart';
import 'package:http/http.dart' as http;

class WelcomePage2 extends StatefulWidget {
  const WelcomePage2({Key? key}) : super(key: key);

  @override
  State<WelcomePage2> createState() => _WelcomePageState();
}

class _WelcomePageState extends State<WelcomePage2> {
  final FirebaseAuthService _auth = FirebaseAuthService();
  List<Album> globalAlbums = [];
  Future<http.Response> fetchAlbum() async {
    var response = await http
        .get(Uri.parse('https://jsonplaceholder.typicode.com/albums'));
    var result = response.body.toString();
    Iterable json = jsonDecode(result);
    List<Album> albums =
        List<Album>.from(json.map((model) => Album.fromJson(model)));

    setState(() {
      globalAlbums = albums;
    });
    print(result);
    var statusCode = response.statusCode;
    return response;
  }

  @override
  void initState() {
    fetchAlbum();
    _signIn();
    _createNewUser();
    super.initState();
  }

  void _signUp() async {
    String email = "abc@g.com";
    String password = "123456";
    User? _user = await _auth.signUpWithEmailAndPassword(email, password);
    if (_user != null) {
      print("User created");
    }
  }

  void _createNewUser() async {
    var user = <String, dynamic>{
      "first": "Alan",
      "middle": "Mathison",
      "last": "Turing",
      "email": "asdf@g.com",
      "password": "123456",
      "born": 1912
    };
    var id = await _auth.createNewUserProfile(user);
    print(id);
  }

  void _signIn() async {
    String email = "abc@g.com";
    String password = "123456";
    User? _user = await _auth.signInWithEmailAndPassword(email, password);
    if (_user != null) {
      print("User logged in");
      print("User logged in");
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      body: Container(
        child: SafeArea(
          child: Container(
              alignment: Alignment.center,
              padding: EdgeInsets.all(16.0),
              margin: EdgeInsets.symmetric(vertical: 10.0),
              color: Color(0xFFFF1A1A),
              transform: Matrix4.rotationZ(0),
              width: double.infinity,
              height: double.infinity,
              child: Column(
                children: [
                  //  MainAxisAlignment: MainAxisAlignment.Center,
                  SizedBox(
                    height: 50,
                  ),
                  Text("Blood Camp",
                      style: TextStyle(
                        fontSize: 50,
                        fontWeight: FontWeight.bold,
                        color: Colors.white,
                        // width: 200,
                        //  height: 5,
                      )),
                  SizedBox(
                    height: 70,
                  ),
                  Positioned(
                    top: 120,
                    bottom:
                        130, // Change this value to position the widget as needed
                    left:
                        0, // Change this value to position the widget as needed
                    right:
                        0, // Change this value to position the widget as needed
                    child: Container(
                      alignment: Alignment.topCenter,
                      height: 220,
                      width: 220,
                      color: Colors.white,
                      child: Image.asset(
                        'assets/images/bda1.png',
                        fit: BoxFit.cover,
                      ),
                    ),
                  ),
                  SizedBox(
                    height: 50,
                  ),
                  Text(
                    "Welcome to Blood donation camp ",
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      fontSize: 30,
                      color: Colors.white,
                      // backgroundColor: Colors.red,
                    ),
                  ),
                  SizedBox(
                    height: 20,
                  ),
                  Padding(
                    padding: const EdgeInsets.only(top: 30),
                    child: ElevatedButton(
                      onPressed: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => const LoginPage()),
                        );
                      },
                      style: ButtonStyle(
                        backgroundColor:
                            MaterialStateProperty.all<Color>(Colors.white),
                        foregroundColor:
                            MaterialStateProperty.all<Color>(Colors.black),
                        minimumSize:
                            MaterialStateProperty.all<Size>(Size(180, 60)),
                        textStyle:
                            MaterialStateProperty.all<TextStyle>(TextStyle(
                          fontSize: 18,
                          fontWeight: FontWeight.bold,
                        )),
                      ),
                      child: Text("Let's Start"),
                    ),
                  ),
                ],
              )),
        ),
      ),
    );
  }
}
