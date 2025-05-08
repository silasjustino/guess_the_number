import 'package:flutter/material.dart';
import 'package:guess_the_number/create_account.dart';
import 'package:guess_the_number/home_page.dart';
import 'package:guess_the_number/my_profile.dart';

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
        appBarTheme: const AppBarTheme().copyWith(
          backgroundColor: Color.fromARGB(255, 28, 28, 28),
          toolbarHeight: 60,
        ),
        elevatedButtonTheme: ElevatedButtonThemeData(
          style: ButtonStyle(
            backgroundColor: WidgetStateProperty.all<Color>(
              Color.fromARGB(255, 0, 137, 237),
            ),
            shape: WidgetStateProperty.all<RoundedRectangleBorder>(
              RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
            ),
          ),
        ),
        textButtonTheme: TextButtonThemeData(
          style: ButtonStyle(
            foregroundColor: WidgetStateProperty.all<Color>(
              Color.fromARGB(255, 0, 137, 237),
            ),
            shape: WidgetStateProperty.all<RoundedRectangleBorder>(
              RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
            ),
          ),
        ),
      ),
      debugShowCheckedModeBanner: false,
      initialRoute: '/',
      routes: {
        '/': (context) => const LoginPage(),
        '/createAccountPage': (context) => const CreateAccountPage(),
        '/homePage': (context) => const HomePage(),
        '/myProfile': (context) => MyProfile(),
      },
    );
  }
}
