import 'dart:typed_data';

import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter_application_1/authentication/login/login.dart';
import 'package:flutter_application_1/authentication/signup/utils.dart';
import 'package:image_picker/image_picker.dart';

class SignUpPage extends StatefulWidget {
  const SignUpPage({Key? key}) : super(key: key);

  @override
  State<SignUpPage> createState() => _SignUpPageState();
}

class _SignUpPageState extends State<SignUpPage> {
  Uint8List? _image;
  final _formKey = GlobalKey<FormState>();
  final ScrollController _controllerOne = ScrollController();
  String? _selectedGender;
  String? _selectedUserType;
  String? _selecteBloodType;

  void selectImage() async {
    Uint8List? img = await pickImage(ImageSource.gallery);
    setState(() {
      _image = img;
    });
  }

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
              //  alignment: Alignment.center,
              child: Column(
                // mainAxisAlignment: MainAxisAlignment.center,
                // crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Text("Sign Up ",
                      textAlign: TextAlign.center,
                      style: TextStyle(
                        fontSize: 36,
                        fontFamily: 'KohSantepheap',
                        fontWeight: FontWeight.bold,
                        color: Colors.white,
                      )),
                  SizedBox(height: 20),
                  Stack(
                    alignment: Alignment.center,
                    children: [
                      _image != null
                          ? CircleAvatar(
                              radius: 64,
                              backgroundImage: MemoryImage(_image!),
                            )
                          : const CircleAvatar(
                              radius: 70,
                              backgroundColor: Colors
                                  .transparent, // Placeholder background color
                              backgroundImage: AssetImage(
                                  'assets/images/signuUP_profile.png'),
                            ),
                      Positioned(
                        bottom: 0,
                        right: 0,
                        child: IconButton(
                          onPressed: selectImage,
                          icon: Icon(Icons.add_a_photo),
                          color: Colors.white,
                        ),
                      ),
                    ],
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
                                TextFormField(
                                  decoration: InputDecoration(
                                    hintText: 'First Name',
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
                                SizedBox(height: 20),
                                TextFormField(
                                  decoration: InputDecoration(
                                    hintText: 'Last Name',
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
                                SizedBox(height: 20),
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
                                SizedBox(height: 20),
                                TextFormField(
                                  decoration: InputDecoration(
                                    hintText: 'Contact Number',
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

                                SizedBox(height: 20),
                                // Dropdown menu for gender selection
                                Container(
                                  decoration: BoxDecoration(
                                    color: Colors.white,
                                    borderRadius: BorderRadius.circular(100),
                                  ),
                                  child: DropdownButtonFormField<String>(
                                    value: _selectedGender,
                                    icon: Icon(Icons.arrow_drop_down),
                                    iconSize: 24,
                                    elevation: 16,
                                    decoration: InputDecoration(
                                      contentPadding: EdgeInsets.symmetric(
                                          vertical: 20.0, horizontal: 20.0),
                                      border: OutlineInputBorder(
                                        borderRadius: BorderRadius.all(
                                            Radius.circular(100)),
                                        borderSide: BorderSide.none,
                                      ),
                                    ),
                                    onChanged: (String? newValue) {
                                      setState(() {
                                        _selectedGender = newValue;
                                      });
                                    },
                                    items: <String>['Male', 'Female']
                                        .map<DropdownMenuItem<String>>(
                                          (String value) =>
                                              DropdownMenuItem<String>(
                                            value: value,
                                            child: Text(value),
                                          ),
                                        )
                                        .toList(),
                                  ),
                                ),
                                SizedBox(height: 20),
                                Container(
                                  decoration: BoxDecoration(
                                    color: Colors.white,
                                    borderRadius: BorderRadius.circular(100),
                                  ),
                                  child: DropdownButtonFormField<String>(
                                    value: _selectedUserType,
                                    icon: Icon(Icons.arrow_drop_down),
                                    iconSize: 24,
                                    elevation: 16,
                                    decoration: InputDecoration(
                                      contentPadding: EdgeInsets.symmetric(
                                          vertical: 20.0, horizontal: 20.0),
                                      border: OutlineInputBorder(
                                        borderRadius: BorderRadius.all(
                                            Radius.circular(100)),
                                        borderSide: BorderSide.none,
                                      ),
                                    ),
                                    onChanged: (String? newValue) {
                                      setState(() {
                                        _selectedUserType = newValue;
                                      });
                                    },
                                    items: <String>[
                                      'Donor',
                                      'Blood Camp Organizer'
                                    ]
                                        .map<DropdownMenuItem<String>>(
                                          (String value) =>
                                              DropdownMenuItem<String>(
                                            value: value,
                                            child: Text(value),
                                          ),
                                        )
                                        .toList(),
                                  ),
                                ),
                                SizedBox(height: 20),
                                Container(
                                  decoration: BoxDecoration(
                                    color: Colors.white,
                                    borderRadius: BorderRadius.circular(100),
                                  ),
                                  child: DropdownButtonFormField<String>(
                                    value: _selecteBloodType,
                                    icon: Icon(Icons.arrow_drop_down),
                                    iconSize: 24,
                                    elevation: 16,
                                    decoration: InputDecoration(
                                      contentPadding: EdgeInsets.symmetric(
                                          vertical: 20.0, horizontal: 20.0),
                                      border: OutlineInputBorder(
                                        borderRadius: BorderRadius.all(
                                            Radius.circular(100)),
                                        borderSide: BorderSide.none,
                                      ),
                                    ),
                                    onChanged: (String? newValue) {
                                      setState(() {
                                        _selecteBloodType = newValue;
                                      });
                                    },
                                    items: <String>[
                                      'A',
                                      'A+',
                                      'A-',
                                      'B',
                                      'B+',
                                      'B-',
                                      'O',
                                      'O+',
                                      'O-'
                                    ]
                                        .map<DropdownMenuItem<String>>(
                                          (String value) =>
                                              DropdownMenuItem<String>(
                                            value: value,
                                            child: Text(value),
                                          ),
                                        )
                                        .toList(),
                                  ),
                                ),
                                SizedBox(height: 20),
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
                                SizedBox(height: 20),
                                TextFormField(
                                  decoration: InputDecoration(
                                    hintText: 'ReType Password',
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
                                SizedBox(height: 20),
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
                                    'Register',
                                    style: TextStyle(
                                      fontSize: 18,
                                      color: Colors.black,
                                      fontFamily: 'MontserratBold',
                                      // fontWeight: FontWeight.normal),
                                    ),
                                  ),
                                ),
                                SizedBox(height: 20),
                                Text(
                                  'I Already Have an Account',
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
                                              const LoginPage()),
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
                                    'Login',
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
