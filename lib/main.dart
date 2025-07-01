import 'package:Agrolens/loading_page.dart';
import 'package:flutter/services.dart';
import 'package:flutter/material.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await SystemChrome.setPreferredOrientations([
    DeviceOrientation.portraitUp,
  ]);
  runApp(const AgrolensApp());
}

class AgrolensApp extends StatelessWidget {
  const AgrolensApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Agrolens',
      theme: ThemeData(
        brightness: Brightness.light,
        primaryColor: Color(0xFF53662f),
      ),
      home: LoadingPage(),
    );
  }
}
