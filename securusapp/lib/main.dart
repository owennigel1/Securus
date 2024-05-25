import 'dart:async';
import 'package:flutter/material.dart';
import 'package:securusapp/screens/authentication.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  // await Firebase.initializeApp(options: DefaultFirebaseOptions.currentPlatform);
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: const Color(0xff9FE870)),
        textTheme: Theme.of(context).textTheme.apply(fontFamily: "MazzardH"),
        sliderTheme: const SliderThemeData(
            showValueIndicator: ShowValueIndicator.always),
        useMaterial3: true,
      ),
      home: const AuthScreen(),
      debugShowCheckedModeBanner: false,
    );
  }
}
