import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class IntroPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;

    return Scaffold(
      body: Container(
        decoration: const BoxDecoration(
          gradient: LinearGradient(
            colors: [
              Color(0xFF9bc03f),
              Color(0xFF53662f), // Olive green
              Color(0xFF404642),
            ],
            begin: Alignment.topLeft,
            end: Alignment.bottomRight,
          ),
        ),
        child: SafeArea(
          child: Padding(
            padding: EdgeInsets.all(size.width * 0.05),
            child: Column(
              children: [
                Expanded(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Image.asset(
                        'assets/images/agrolens_logo_transparent.png',
                        width: size.width * 0.5,
                        height: size.width * 0.5,
                        fit: BoxFit.contain,
                      ),
                      SizedBox(height: size.height * 0.03),
                      Text(
                        'Welcome to Agrolens',
                        style: TextStyle(
                          fontSize: size.width * 0.06,
                          fontWeight: FontWeight.bold,
                          color: Colors.white,
                        ),
                      ),
                      SizedBox(height: size.height * 0.030),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceAround,
                        children: [
                          Column(
                            children: const [
                              Icon(CupertinoIcons.camera_fill,
                                  color: Color(0xFF9bc03f), size: 24.0),
                              SizedBox(height: 4),
                              Text('Scan',
                                  style: TextStyle(color: Colors.white)),
                            ],
                          ),
                          Column(
                            children: const [
                              Icon(CupertinoIcons.hand_raised_slash_fill,
                                  color: Colors.yellow, size: 24.0),
                              SizedBox(height: 4),
                              Text('Identify',
                                  style: TextStyle(color: Colors.white)),
                            ],
                          ),
                          Column(
                            children: const [
                              Icon(CupertinoIcons.hourglass_tophalf_fill,
                                  color: Color(0XFF9bc03f), size: 24.0),
                              SizedBox(height: 4),
                              Text('Save',
                                  style: TextStyle(color: Colors.white)),
                            ],
                          ),
                        ],
                      ),
                      SizedBox(height: size.height * 0.030),
                      Padding(
                        padding: const EdgeInsets.all(8.1),
                        child: Center(
                          child: Text(
                            'You can now easily identify common rice leaf diseases using Agrolens.\n\nYour AI farmer friendly app',
                            style: TextStyle(
                              fontSize: size.width * 0.04,
                              fontWeight: FontWeight.bold,
                              color: Colors.white,
                            ),
                            textAlign: TextAlign.justify,
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
                // Button pinned at the bottom
                SizedBox(
                  width: double.infinity,
                  height: size.height * 0.065,
                  child: ElevatedButton(
                    onPressed: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => const Placeholder(),
                        ),
                      );
                    },
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.white,
                      foregroundColor: const Color(0xFF53662f),
                      elevation: 2,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(20),
                      ),
                    ),
                    child: Text(
                      'Start Camera',
                      style: TextStyle(
                          color: Colors.black, fontSize: size.width * 0.04),
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
