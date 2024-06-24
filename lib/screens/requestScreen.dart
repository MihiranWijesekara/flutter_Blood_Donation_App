import 'package:flutter/material.dart';
import 'package:flutter_application_1/authentication/login/login.dart';
import 'package:flutter_application_1/screens/donorScreen.dart';

class RequestScreenPage extends StatefulWidget {
  const RequestScreenPage({super.key});

  @override
  State<RequestScreenPage> createState() => _RequestScreenPageState();
}

class _RequestScreenPageState extends State<RequestScreenPage> {
  final ScrollController _controllerOne = ScrollController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Container(
          decoration: const BoxDecoration(
            gradient: LinearGradient(
              begin: Alignment.topCenter,
              end: Alignment.bottomCenter,
              colors: [Colors.white, Colors.white],
            ),
          ),
          child: Column(
            children: [
              const HeaderSection(),
              Expanded(
                child: Scrollbar(
                  controller: _controllerOne,
                  thumbVisibility: true,
                  child: SingleChildScrollView(
                    controller: _controllerOne,
                    child: Padding(
                      padding: const EdgeInsets.all(16.0),
                      child: InfoCardWidget(
                        controllerOne: _controllerOne,
                      ),
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class HeaderSection extends StatelessWidget {
  const HeaderSection({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 411,
      height: 128,
      decoration: const BoxDecoration(
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
          const Text(
            'Request',
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
                  icon: const Icon(
                    Icons.arrow_back_sharp,
                    size: 40,
                    color: Colors.white,
                  ),
                  onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => const DonorScreenPage()),
                    );
                  },
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}

class InfoCardWidget extends StatelessWidget {
  final ScrollController controllerOne;
  const InfoCardWidget({
    Key? key,
    required this.controllerOne,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        const SizedBox(height: 8),
        Card(
          elevation: 4,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(15),
          ),
          child: Padding(
            padding: EdgeInsets.all(16.0),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                const Text(
                  'Title',
                  style: TextStyle(
                    fontSize: 24,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                const SizedBox(height: 8),
                const Text(
                  'Date : 2020.10.20',
                  style: TextStyle(
                    fontSize: 15,
                    fontWeight: FontWeight.w500,
                  ),
                ),
                SizedBox(height: 8),
                const Text(
                  'Address : Nupe Town, Matara',
                  style: TextStyle(
                    fontSize: 15,
                    fontWeight: FontWeight.w500,
                  ),
                ),
                const SizedBox(height: 8),
                const Text(
                  'This is some description text that provides more details about the info card. It can be multiple lines long and provides additional context to the user.',
                ),
                SizedBox(height: 16),
                Row(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: <Widget>[
                    ElevatedButton(
                      onPressed: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => const LoginPage()),
                        );
                      },
                      style: ElevatedButton.styleFrom(
                        backgroundColor: const Color.fromARGB(255, 210, 36, 24),
                        minimumSize: const Size(20, 40),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(18),
                        ),
                      ),
                      child: const Text(
                        'Join Camp',
                        style: TextStyle(
                          fontSize: 17,
                          color: Colors.white,
                          fontFamily: 'MontserratBold',
                          fontWeight: FontWeight.bold,
                        ),
                        textAlign: TextAlign.center,
                      ),
                    ),
                    const SizedBox(
                      width: 4,
                    ),
                    ElevatedButton(
                      onPressed: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => const LoginPage()),
                        );
                      },
                      style: ElevatedButton.styleFrom(
                        backgroundColor: Color.fromARGB(255, 255, 255, 255),
                        minimumSize: Size(20, 40),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(18),
                        ),
                      ),
                      child: const Text(
                        'Decline',
                        style: TextStyle(
                          fontSize: 17,
                          color: Colors.black,
                          fontFamily: 'MontserratBold',
                          fontWeight: FontWeight.w300,
                        ),
                        textAlign: TextAlign.center,
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ),
        const SizedBox(height: 8),
      ],
    );
  }
}
