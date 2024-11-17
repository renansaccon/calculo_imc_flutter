import 'package:calculo_imc_flutter/home_screen.dart';
import 'package:calculo_imc_flutter/result_Show.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      routes: {
        '/home' : (context) => HomeScreen(),
        '/result' : (context) => ShowResult()
      },
      initialRoute: '/home',
    );
  }
}

