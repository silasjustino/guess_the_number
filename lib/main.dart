import 'package:flutter/material.dart';
import 'package:guess_the_number/create_account.dart';

import 'login.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData.dark().copyWith(
        brightness: Brightness.dark,
        primaryColor: Colors.blue[900],
        scaffoldBackgroundColor: Colors.grey[900],
        appBarTheme: const AppBarTheme().copyWith(
          backgroundColor: Colors.grey[900],
          toolbarHeight: 60,
          shape: const Border(bottom: BorderSide(color: Colors.grey)),
          //shadowColor: Colors.black.withOpacity(0),
        ),
      ),
      debugShowCheckedModeBanner: false,
      home: const LoginPage(),
      routes: {
        '/createAccountPage': (context) => const CreateAccountPage(),
        '/homePage': (context) => const LoginPage(),
      },
    );
  }
}
