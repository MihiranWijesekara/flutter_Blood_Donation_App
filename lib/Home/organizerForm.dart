import 'package:flutter/material.dart';
import 'package:flutter_application_1/Home/organizer_Home.dart';

class OrganizerFormPage extends StatefulWidget {
  const OrganizerFormPage({Key? key}) : super(key: key);

  @override
  State<OrganizerFormPage> createState() => _OrganizerFormPageState();
}

class _OrganizerFormPageState extends State<OrganizerFormPage> {
  final _formKey = GlobalKey<FormState>();
  final ScrollController _controllerOne = ScrollController();
  String _date = '';
  String _address = '';
  String _currentLocation = '';
  String _description = '';

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
                  width: 411,
                  height: 128,
                  decoration: BoxDecoration(
                    color: Color(0xFFFF1A1A),
                    borderRadius: BorderRadius.only(
                      topLeft: Radius.circular(0),
                      topRight: Radius.circular(0),
                      bottomLeft: Radius.circular(50),
                      bottomRight: Radius.circular(50),
                    ),
                  ),
                  child: Stack(
                    alignment: Alignment.center,
                    children: [
                      Text(
                        'Organize Blood Camp',
                        style: TextStyle(
                          fontSize: 24,
                          color: Colors.white,
                          fontFamily: 'MontserratBold',
                        ),
                      ),
                      Positioned(
                        top: 8,
                        left: 10,
                        child: IconButton(
                          icon: Icon(
                            Icons.arrow_back_sharp,
                            size: 30,
                            color: Colors.white,
                          ),
                          onPressed: () {
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) =>
                                      const OrganizerHomePage()),
                            );
                          },
                        ),
                      ),
                    ],
                  ),
                ),
                SizedBox(
                  height: 10,
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
                            children: <Widget>[
                              TextFormField(
                                // controller: _emailController,
                                decoration: InputDecoration(
                                  hintText: 'Date',
                                  filled: true,
                                  fillColor: Colors.white,
                                  border: OutlineInputBorder(
                                    borderRadius:
                                        BorderRadius.all(Radius.circular(100)),
                                    borderSide: BorderSide(
                                      color: Colors
                                          .black, // Set the border color to black
                                      width:
                                          2.0, // You can adjust the border width
                                    ),
                                  ),
                                  contentPadding: EdgeInsets.symmetric(
                                      vertical: 20.0, horizontal: 145.0),
                                ),
                              ),
                              SizedBox(height: 16.0),
                              TextFormField(
                                // controller: _emailController,
                                decoration: InputDecoration(
                                  hintText: 'Address',
                                  filled: true,
                                  fillColor: Colors.white,
                                  border: OutlineInputBorder(
                                    borderRadius:
                                        BorderRadius.all(Radius.circular(100)),
                                    borderSide: BorderSide(
                                      color: Colors
                                          .black, // Set the border color to black
                                      width:
                                          2.0, // You can adjust the border width
                                    ),
                                  ),
                                  contentPadding: EdgeInsets.symmetric(
                                      vertical: 20.0, horizontal: 130.0),
                                ),
                              ),
                              SizedBox(height: 16.0),
                              TextFormField(
                                // controller: _emailController,
                                decoration: InputDecoration(
                                  hintText: 'Current Location',
                                  filled: true,
                                  fillColor: Colors.white,
                                  border: OutlineInputBorder(
                                    borderRadius:
                                        BorderRadius.all(Radius.circular(100)),
                                    borderSide: BorderSide(
                                      color: Colors
                                          .black, // Set the border color to black
                                      width:
                                          2.0, // You can adjust the border width
                                    ),
                                  ),
                                  contentPadding: EdgeInsets.symmetric(
                                      vertical: 20.0, horizontal: 100.0),
                                ),
                              ),
                              SizedBox(height: 16.0),
                              Container(
                                height: 200,
                                child: TextFormField(
                                  // controller: _emailController,
                                  decoration: InputDecoration(
                                    hintText: 'Description',
                                    filled: true,
                                    fillColor: Colors.white,
                                    border: OutlineInputBorder(
                                      borderRadius: BorderRadius.only(
                                        topLeft: Radius.circular(50),
                                        topRight: Radius.circular(50),
                                        bottomRight: Radius.circular(50),
                                        bottomLeft: Radius.circular(50),
                                      ),
                                      borderSide: BorderSide(
                                        color: Colors
                                            .black, // Set the border color to black
                                        width:
                                            2.0, // You can adjust the border width
                                      ),
                                    ),
                                    contentPadding: EdgeInsets.symmetric(
                                      vertical: 100.0,
                                      horizontal:
                                          120.0, // Adjusted horizontal padding to be more reasonable
                                    ),
                                  ),
                                  maxLines:
                                      null, // Allows the TextFormField to expand to the specified height
                                  minLines:
                                      6, // Minimum number of lines to display (approximately 200 height)
                                ),
                              ),
                              SizedBox(height: 20.0),
                              ElevatedButton(
                                onPressed: () {
                                  if (_formKey.currentState != null &&
                                      _formKey.currentState!.validate()) {
                                    _formKey.currentState!.save();
                                    // Add your form submission logic here
                                  }
                                },
                                style: ElevatedButton.styleFrom(
                                  backgroundColor:
                                      Color.fromARGB(255, 210, 36, 24),
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
    );
  }
}
