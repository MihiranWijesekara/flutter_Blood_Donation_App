import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter_application_1/authentication/signup/signup.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({Key? key}) : super(key: key);

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  final _formKey = GlobalKey<FormState>();
  final ScrollController _controllerOne = ScrollController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      body: Container(
        child: SafeArea(
          child: Container(
            color: Colors.transparent,
            child: Container(
              width: double.infinity,
              height: double.infinity,
              margin: EdgeInsets.symmetric(vertical: 10),
              color: Color(0xFFFF1A1A),
              //alignment: Alignment.center,
              child: Column(
                // mainAxisAlignment: MainAxisAlignment.center,

                children: [
                  SizedBox(height: 10),
                  Positioned(
                    left: 98,
                    top: 74,
                    child: Text(
                      'Sign In',
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 48,
                        fontWeight: FontWeight.bold,
                        fontFamily: 'KohSantepheap',
                      ),
                    ),
                  ),
                  Positioned(
                    left: 98,
                    top: 100, // Adjust the top value as needed
                    child: Image.asset(
                      'assets/images/images1.png',
                      width: 150,
                      height: 150,
                      // fit: BoxFit.cover,
                    ),
                  ),
                  Expanded(
                    child: Scrollbar(
                      controller: _controllerOne,
                      thumbVisibility: true,
                      child: SingleChildScrollView(
                        controller: _controllerOne,
                        child: Padding(
                          padding: const EdgeInsets.all(16.0),
                          child: Form(
                            key: _formKey,
                            child: Column(
                              children: [
                                SizedBox(
                                  height: 50,
                                ),
                                TextFormField(
                                  decoration: InputDecoration(
                                    hintText: 'Email',
                                    filled: true,
                                    fillColor: Colors.white,
                                    border: OutlineInputBorder(
                                      borderRadius: BorderRadius.all(
                                          Radius.circular(100)),
                                      borderSide: BorderSide.none,
                                    ),
                                    contentPadding: EdgeInsets.symmetric(
                                        vertical: 20.0, horizontal: 20.0),
                                  ),
                                ),
                                SizedBox(
                                  height: 30,
                                ),
                                TextFormField(
                                  decoration: InputDecoration(
                                    hintText: 'Password',
                                    filled: true,
                                    fillColor: Colors.white,
                                    border: OutlineInputBorder(
                                      borderRadius: BorderRadius.all(
                                          Radius.circular(100)),
                                      borderSide: BorderSide.none,
                                    ),
                                    contentPadding: EdgeInsets.symmetric(
                                        vertical: 20.0, horizontal: 20.0),
                                  ),
                                ),
                                SizedBox(height: 40),
                                ElevatedButton(
                                  onPressed: () {
                                    // Add your onPressed functionality here
                                  },
                                  style: ElevatedButton.styleFrom(
                                    backgroundColor: Colors.white,
                                    minimumSize: Size(200, 55),
                                    shape: RoundedRectangleBorder(
                                      borderRadius: BorderRadius.circular(100),
                                    ),
                                  ),
                                  child: Text(
                                    'Login',
                                    style: TextStyle(
                                        fontSize: 20,
                                        color: Colors.black,
                                        fontFamily: 'MontserratBold',
                                        fontWeight: FontWeight.normal),
                                  ),
                                ),
                                SizedBox(height: 30),
                                Text(
                                  'You Do Not Have Account',
                                  style: TextStyle(
                                    color: Colors.white,
                                    fontSize: 16,
                                    fontFamily: 'KohSantepheap',
                                  ),
                                ),
                                SizedBox(height: 20),
                                ElevatedButton(
                                  onPressed: () {
                                    Navigator.push(
                                      context,
                                      MaterialPageRoute(
                                          builder: (context) =>
                                              const SignUpPage()),
                                    );
                                  },
                                  style: ElevatedButton.styleFrom(
                                    backgroundColor: Colors.red,
                                    minimumSize: Size(170, 50),
                                    shape: RoundedRectangleBorder(
                                      borderRadius: BorderRadius.circular(100),
                                      side: BorderSide(
                                          color: Colors.black, width: 1),
                                    ),
                                  ),
                                  child: Text(
                                    'Register',
                                    style: TextStyle(
                                      fontSize: 18,
                                      color: Colors.white,
                                      fontFamily: 'Montserrat',
                                      fontWeight: FontWeight.bold,
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
