import 'package:flutter/material.dart';

class WelcomePage2 extends StatefulWidget {
  const WelcomePage2({Key? key}) : super(key: key);

  @override
  State<WelcomePage2> createState() => _WelcomePageState();
}

class _WelcomePageState extends State<WelcomePage2> {
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
              color: Color.fromRGBO(255, 102, 102, 1.0),
              transform: Matrix4.rotationZ(0),
              width: double.infinity,
              height: double.infinity,
              child: Column(
                children: [
                  //  MainAxisAlignment: MainAxisAlignment.Center,
                  Text("Blood Champ",
                      style: TextStyle(
                        fontSize: 30,
                        color: Colors.white,
                       // width: 200,
                        height: 9,
                      )),
                  Text(
                    "Welcome to Blood donation champ application",
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      fontSize: 20,
                      color: Colors.white,
                      
                      // backgroundColor: Colors.red,
                    ),
                  ),

                  Padding(
                    padding: const EdgeInsets.only(top: 50),
                    child: ElevatedButton(
                      onPressed: () {},
                      child: Text("Let's Start",
                      style: TextStyle(
                           color:Colors.black, 
                      )), 
                    ),
                  ),
                  
                  /*   Padding(
                    padding: const EdgeInsets.only(bottom: 20),
                    child: Container(
                      height: 200,
                      width: 200,
                      color: Colors.white,
                      child: Image.asset("")
                  ) */
                ],
              )),
        ),
      ),
    );
  }
}
