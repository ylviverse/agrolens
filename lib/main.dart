import 'package:Agrolens/pages/loading_page.dart';
import 'package:flutter/services.dart';
import 'package:flutter/material.dart';
import 'package:flutter_native_splash/flutter_native_splash.dart';

void main() async {
 
  WidgetsBinding widgetsBinding = WidgetsFlutterBinding.ensureInitialized();


  FlutterNativeSplash.preserve(widgetsBinding: widgetsBinding);

  await SystemChrome.setPreferredOrientations([
    DeviceOrientation.portraitUp,
  ]);


  runApp(const AgrolensApp());
}

class AgrolensApp extends StatefulWidget {
  const AgrolensApp({super.key});

  @override
  State<AgrolensApp> createState() => _AgrolensAppState();
} 

class _AgrolensAppState extends State<AgrolensApp> {
  @override
  void initState() {
    super.initState();
    initialization();
  }

  void initialization() async {
   
    await Future.delayed(const Duration(seconds: 2));

    FlutterNativeSplash.remove();
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Agrolens',
      theme: ThemeData(
        brightness: Brightness.light,
        primaryColor: const Color(0xFF53662f), 
      ),
      home: LoadingPage(),
    );
  }
}