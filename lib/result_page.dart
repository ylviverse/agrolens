import 'dart:io';
import 'package:flutter/material.dart'; 
import 'package:flutter/cupertino.dart';
import 'package:camera/camera.dart';
import 'package:lottie/lottie.dart';

class ResultPage extends StatelessWidget {
  final XFile capturedImage;

  const ResultPage({
    super.key,
    required this.capturedImage,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold( // Changed from CupertinoPageScaffold to Scaffold
      extendBodyBehindAppBar: true, // This is crucial for transparent AppBar
      appBar: AppBar( // Using AppBar instead of CupertinoNavigationBar
        backgroundColor: Colors.transparent, // Made AppBar transparent
        elevation: 0, // Removes the shadow
        leading: CupertinoNavigationBarBackButton( // Keep Cupertino back button
          color: CupertinoColors.white, // Adjust color for visibility
          onPressed: () {
            Navigator.of(context).pop();
          },
        ),
        title: const Text(
          'Analysis Result',
          style: TextStyle(
            fontSize: 17,
            fontWeight: FontWeight.w600,
            color: CupertinoColors.white, // Ensure text is visible
          ),
        ),
      ),
      body: Container(
        decoration: const BoxDecoration(
          gradient: LinearGradient(
            colors: [
              Color(0xFF9bc03f),
              Color(0xFF404642),
              Color(0xFFecc95d),
            ],
            begin: Alignment.topCenter,
            end: Alignment.bottomRight,
          ),
        ),
        child: SafeArea( // SafeArea is still useful here
          child: SingleChildScrollView(
            padding: const EdgeInsets.all(20),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [

                // Captured Image Display
                Container(
                  width: double.infinity,
                  height: 300,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(16),
                    boxShadow: [
                      BoxShadow(
                        color: CupertinoColors.systemGrey.withOpacity(0.3),
                        blurRadius: 10,
                        offset: const Offset(0, 4),
                      ),
                    ],
                  ),
                  child: ClipRRect(
                    borderRadius: BorderRadius.circular(16),
                    child: Image.file(
                      File(capturedImage.path),
                      fit: BoxFit.cover,
                    ),
                  ),
                ),

                const SizedBox(height: 30),

                // Placeholder for Lottie Animation (replaces checkmark icon)
              Container(
                  width: 150, // Adjust width/height as needed for your animation
                  height: 150,
                  decoration: const BoxDecoration(
                    color: Colors.transparent, // Keep background transparent
                    shape: BoxShape.circle,
                  ),
                  child: Lottie.asset( // Lottie animation added here
                    'assets/animations/walking_plant.json',
                    fit: BoxFit.contain, // Adjust fit as needed
                  ),
                ),

                const SizedBox(height: 20),

                // Health Status Text
                const Text(
                  'Your rice looks healthy!',
                  style: TextStyle(
                    fontSize: 28,
                    fontWeight: FontWeight.bold,
                    color: CupertinoColors.white,
                  ),
                  textAlign: TextAlign.center,
                ),

                const SizedBox(height: 20),

                // Analysis Details Box (remains transparent)
                Container(
                  width: double.infinity,
                  padding: const EdgeInsets.all(20),
                  decoration: BoxDecoration(
                    color: Colors.transparent,
                    borderRadius: BorderRadius.circular(15),
                    border: Border.all(
                      color: CupertinoColors.white.withOpacity(0.3),
                    ),
                  ),
                  child: Column(
                    children: [
                      Row(
                        children: [
                          Icon(
                            CupertinoIcons.info_circle,
                            color: CupertinoColors.white,
                            size: 20,
                          ),
                          const SizedBox(width: 8),
                          const Text(
                            'Analysis Details',
                            style: TextStyle(
                              fontSize: 16,
                              fontWeight: FontWeight.w600,
                              color: CupertinoColors.white,
                            ),
                          ),
                        ],
                      ),
                      const SizedBox(height: 12),
                      const Text(
                        'Based on the image analysis, your rice plant appears to be in good health with no visible signs of disease.',
                        style: TextStyle(
                          fontSize: 14,
                          color: CupertinoColors.white,
                          height: 1.4,
                        ),
                      ),
                    ],
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