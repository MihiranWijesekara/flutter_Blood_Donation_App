import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_application_1/Home/BloodShapePainter.dart';
import 'package:flutter_application_1/Home/organizerForm.dart';

class OrganizerHomePage extends StatefulWidget {
  const OrganizerHomePage({Key? key}) : super(key: key);

  @override
  State<OrganizerHomePage> createState() => _OrganizerHomePageState();
}

class _OrganizerHomePageState extends State<OrganizerHomePage> {
  late String firstName = '';
  late String profileImageUrl = '';

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
            profileImageUrl = userDoc['profileImage'];
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
      // backgroundColor: Colors.black,
      drawer: Drawer(
        child: ListView(
          padding: EdgeInsets.zero,
          children: <Widget>[
            DrawerHeader(
              decoration: BoxDecoration(
                color: Colors.red,
              ),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  SizedBox(height: 10), // Adjust the height as needed
                  CircleAvatar(
                    radius: 60, // Adjust the radius as needed
                    backgroundColor: Colors.transparent,
                    backgroundImage: profileImageUrl.isNotEmpty
                        ? NetworkImage(profileImageUrl)
                        : AssetImage('assets/images/signuUP_profile.png')
                            as ImageProvider,
                  ),
                ],
              ),
            ),

            SizedBox(
              height: 20,
            ),

            Container(
              height: 70, // Set the height here
              width: double.infinity, // Set the width here
              child: ListTile(
                leading: Icon(Icons.send),
                title: Text('Request'),
                onTap: () {
                  // Navigate to home
                  Navigator.pop(context);
                },
              ),
            ),
            Container(
              height: 70, // Set the height here
              width: double.infinity, // Set the width here
              child: ListTile(
                leading: Icon(Icons.location_on_rounded),
                title: Text('Location'),
                onTap: () {
                  // Navigate to home
                  Navigator.pop(context);
                },
              ),
            ),
            Container(
              height: 70, // Set the height here
              width: double.infinity, // Set the width here
              child: ListTile(
                leading: Icon(Icons.home),
                title: Text('Home'),
                onTap: () {
                  // Navigate to home
                  Navigator.pop(context);
                },
              ),
            ),
            ListTile(
              leading: Icon(Icons.event),
              title: Text('Organize Blood Camp'),
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => OrganizerFormPage()),
                );
              },
            ),
            // Add more menu items here
          ],
        ),
      ),
      body: SafeArea(
        child: Container(
          decoration: BoxDecoration(
            gradient: LinearGradient(
              begin: Alignment.topCenter,
              end: Alignment.bottomCenter,
              colors: [Color(0xFFFF1A1A), Colors.white],
            ),
          ),
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
                        child: Builder(
                          builder: (context) {
                            return IconButton(
                              icon: Icon(
                                Icons.menu,
                                size: 40,
                                color: Colors.white,
                              ),
                              onPressed: () {
                                Scaffold.of(context).openDrawer();
                              },
                            );
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
                        minimumSize: Size(300, 60),
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
                          fontSize: 17,
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
