import 'package:flutter/cupertino.dart';
import 'package:flutter/services.dart';
import 'intro_page.dart';

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
    return CupertinoApp(
      debugShowCheckedModeBanner: false,
      title: 'Agrolens',
      theme: const CupertinoThemeData(
        brightness: Brightness.light,
        primaryColor: Color(0xFF53662f),
      ),
      home: IntroPage(),
    );
  }
}
