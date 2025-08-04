import 'package:Agrolens/camera_config/camera.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class IntroPage extends StatefulWidget {
const IntroPage({super.key});
@override
IntroPageState createState() => IntroPageState();
}

class IntroPageState extends State<IntroPage> with TickerProviderStateMixin {
late AnimationController _fadeController;
late AnimationController _slideController;
late Animation<double> _fadeAnimation;
late Animation<Offset> _slideAnimation;

@override
void initState() {
super.initState();
_fadeController = AnimationController(
duration: const Duration(milliseconds: 1000),
vsync: this,
);
_slideController = AnimationController(
duration: const Duration(milliseconds: 800),
vsync: this,
);

_fadeAnimation = Tween<double>(begin: 0.0, end: 1.0).animate(
CurvedAnimation(parent: _fadeController, curve: Curves.easeInOut),
);

_slideAnimation = Tween<Offset>(
begin: const Offset(0, 0.3),
end: Offset.zero,
).animate(
CurvedAnimation(parent: _slideController, curve: Curves.easeOutBack));

// Start animations
_fadeController.forward();
Future.delayed(const Duration(milliseconds: 300), () {
_slideController.forward();
});
}

@override
void dispose() {
_fadeController.dispose();
_slideController.dispose();
super.dispose();
}

@override
Widget build(BuildContext context) {
final size = MediaQuery.of(context).size;

return Scaffold(
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
// Animated Logo
Image.asset(
'assets/images/agrolens_logo_transparent.png',
width: size.width * 0.4,
height: size.width * 0.4,
fit: BoxFit.contain,
),

SizedBox(height: size.height * 0.04),

// Animated Welcome Text
SlideTransition(
position: _slideAnimation,
child: FadeTransition(
opacity: _fadeAnimation,
child: Column(
children: [
Text(
'Welcome to',
style: TextStyle(
fontSize: size.width * 0.045,
fontWeight: FontWeight.w300,
color: Colors.white.withOpacity(0.9),
),
),
Text(
'Agrolens',
style: TextStyle(
fontSize: size.width * 0.08,
fontWeight: FontWeight.bold,
color: Colors.white,
letterSpacing: 1.2,
),
),
],
),
),
),

SizedBox(height: size.height * 0.04),

// Enhanced Feature Icons
SlideTransition(
position: _slideAnimation,
child: Container(
padding: const EdgeInsets.symmetric(
vertical: 20, horizontal: 16),
decoration: BoxDecoration(
color: Colors.white.withOpacity(0.1),
borderRadius: BorderRadius.circular(16),
border: Border.all(
color: Colors.white.withOpacity(0.2),
width: 1,
),
),
child: Row(
mainAxisAlignment: MainAxisAlignment.spaceAround,
children: [
_buildFeatureItem(
CupertinoIcons.camera_fill,
'Scan',
const Color(0xFF9bc03f),
),
Container(
width: 1,
height: 40,
color: Colors.white.withOpacity(0.3),
),
_buildFeatureItem(
CupertinoIcons.eye_fill,
'Identify',
Colors.amber,
),
Container(
width: 1,
height: 40,
color: Colors.white.withOpacity(0.3),
),
_buildFeatureItem(
CupertinoIcons.heart_fill,
'Protect',
const Color(0xFF9bc03f),
),
],
),
),
),

SizedBox(height: size.height * 0.04),

// Enhanced Description
SlideTransition(
position: _slideAnimation,
child: Container(
padding: const EdgeInsets.all(20),
decoration: BoxDecoration(
color: Colors.white.withOpacity(0.05),
borderRadius: BorderRadius.circular(16),
),
child: Column(
children: [
Text(
'Your AI farmer friendly app',
style: TextStyle(
fontSize: size.width * 0.045,
fontWeight: FontWeight.w600,
color: Colors.white,
),
textAlign: TextAlign.center,
),
SizedBox(height: size.height * 0.015),
Text(
'Instantly identify rice leaf diseases with a click of the camera in seconds.',
style: TextStyle(
fontSize: size.width * 0.038,
fontWeight: FontWeight.w400,
color: Colors.white.withOpacity(0.9),
height: 1.4,
),
textAlign: TextAlign.justify,
),
],
),
),
),
],
),
),

// Enhanced Button
SlideTransition(
position: _slideAnimation,
child: Container(
width: double.infinity,
height: size.height * 0.07,
decoration: BoxDecoration(
borderRadius: BorderRadius.circular(25),
boxShadow: [
BoxShadow(
color: Colors.black.withOpacity(0.2),
blurRadius: 15,
offset: const Offset(0, 5),
),
],
),
child: ElevatedButton.icon(
onPressed: () {
Navigator.push(
context,
PageRouteBuilder(
pageBuilder:
(context, animation, secondaryAnimation) =>
const CameraScreen(),
transitionsBuilder: (context, animation,
secondaryAnimation, child) {
return SlideTransition(
position: Tween<Offset>(
begin: const Offset(1.0, 0.0),
end: Offset.zero,
).animate(animation),
child: child,
);
},
),
);
},
icon: const Icon(CupertinoIcons.camera_fill),
label: Text(
'Start Camera',
style: TextStyle(
fontSize: size.width * 0.045,
fontWeight: FontWeight.w600,
),
),
style: ElevatedButton.styleFrom(
backgroundColor: Colors.white,
foregroundColor: const Color(0xFF53662f),
elevation: 0,
shape: RoundedRectangleBorder(
borderRadius: BorderRadius.circular(25),
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

Widget _buildFeatureItem(IconData icon, String label, Color iconColor) {
return Column(
children: [
Container(
padding: const EdgeInsets.all(8),
decoration: BoxDecoration(
color: iconColor.withOpacity(0.2),
borderRadius: BorderRadius.circular(12),
),
child: Icon(
icon,
color: iconColor,
size: 24.0,
),
),
const SizedBox(height: 8),
Text(
label,
style: const TextStyle(
color: Colors.white,
fontWeight: FontWeight.w500,
),
),
],
);
}
}