import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_application_1/Home/BloodShapePainter.dart';
import 'package:flutter_application_1/Home/organizerForm.dart';
import 'package:shape_maker/shape_maker.dart';
import 'package:shape_maker/shape_maker_painter.dart';

class OrganizerHomePage extends StatefulWidget {
  const OrganizerHomePage({Key? key}) : super(key: key);

  @override
  State<OrganizerHomePage> createState() => _OrganizerHomePageState();
}

class _OrganizerHomePageState extends State<OrganizerHomePage> {
  late String firstName = ''; // State variable to store first name

  @override
  void initState() {
    super.initState();
    fetchFirstName(); // Call the method to fetch first name when widget initializes
  }

  void fetchFirstName() async {
    try {
      // Get current user's ID from Firebase Authentication
      String? uid = FirebaseAuth.instance.currentUser?.uid;
      if (uid != null) {
        // Use the retrieved user ID in Firestore query
        var userDoc =
            await FirebaseFirestore.instance.collection('users').doc(uid).get();
        if (userDoc.exists) {
          setState(() {
            firstName = userDoc['firstName'];
          });
        } else {
          print('Document does not exist');
        }
      } else {
        print('User is not authenticated');
      }
    } catch (e) {
      print('Error fetching first name: $e');
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      body: SafeArea(
        child: Container(
          color: Colors.transparent,
          child: Container(
            width: double.infinity,
            height: double.infinity,
            margin: EdgeInsets.symmetric(vertical: 10),
            color: Color.fromARGB(255, 255, 255, 255),
            child: Column(
              children: [
                Container(
                  width: 412,
                  height: 200,
                  decoration: BoxDecoration(
                    color: Color(0xFFFF1A1A),
                    borderRadius: BorderRadius.only(
                      topLeft: Radius.circular(0),
                      topRight: Radius.circular(0),
                      bottomLeft: Radius.circular(70),
                      bottomRight: Radius.circular(70),
                    ),
                  ),
                  child: Stack(
                    alignment: Alignment.center,
                    children: [
                      Text(
                        'Hello $firstName',
                        style: TextStyle(
                          fontSize: 30,
                          color: Colors.white,
                          fontFamily: 'MontserratBold',
                        ),
                      ),
                      Positioned(
                        top: 8,
                        left: 10,
                        child: IconButton(
                          icon: Icon(
                            Icons.menu,
                            size: 40,
                            color: Colors.white,
                          ),
                          onPressed: () {
                            print('Menu button pressed');
                          },
                        ),
                      ),
                    ],
                  ),
                ),
                SizedBox(
                  height: 50,
                ),
                Expanded(
                  child: Container(
                    width: 200,
                    decoration: BoxDecoration(
                      color: Color.fromARGB(255, 255, 255, 255),
                      borderRadius: BorderRadius.all(Radius.circular(40)),
                      boxShadow: [
                        BoxShadow(
                          color: Colors.black.withOpacity(0.2),
                          spreadRadius: 2,
                          blurRadius: 5,
                          offset: Offset(0, 3),
                        ),
                      ],
                    ),
                    child: Stack(
                      alignment: Alignment.center,
                      children: [
                        Padding(
                          padding: EdgeInsets.only(bottom: 140),
                          child: Center(
                            child: Text(
                              'Total Blood Camp',
                              style: TextStyle(
                                fontSize: 24,
                                color: Colors.black,
                                fontFamily: 'MontserratBold',
                              ),
                              textAlign: TextAlign.center,
                            ),
                          ),
                        ),
                        Positioned(
                          bottom: 50,
                          child: CustomPaint(
                            size: Size(100, 100),
                            painter: BloodShapePainter(
                                bgColor: Colors.red, text: '20'),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
                Expanded(
                  child: Center(
                    child: ElevatedButton(
                      onPressed: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => const OrganizerFormPage()),
                        );
                      },
                      style: ElevatedButton.styleFrom(
                        backgroundColor: Color.fromARGB(255, 210, 36, 24),
                        minimumSize: Size(250, 70),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.only(
                            topLeft: Radius.circular(18),
                            topRight: Radius.circular(18),
                            bottomLeft: Radius.circular(18),
                            bottomRight: Radius.circular(18),
                          ),
                        ),
                      ),
                      child: Text(
                        'Organize\nBlood Camp',
                        style: TextStyle(
                          fontSize: 20,
                          color: Colors.white,
                          fontFamily: 'MontserratBold',
                          fontWeight: FontWeight.bold,
                        ),
                        textAlign: TextAlign.center,
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
