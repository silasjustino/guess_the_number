import 'package:flutter/material.dart';
import 'dart:math';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  int attempts = 0;
  int targetNumber = Random().nextInt(1000);
  List<int> guess = [0, 0, 0];
  String message = 'Dê um palpite...';
  IconData icon = Icons.help_outline;

  void checkGuess() {
    int userGuess = guess[0] * 100 + guess[1] * 10 + guess[2];
    setState(() {
      attempts++;
      if (userGuess == targetNumber) {
        message = "Parabéns!";
        icon = Icons.check_circle_outline;
      } else if (userGuess > targetNumber) {
        message = "É menor!";
      } else {
        message = "É maior!";
      }
    });
  }

  void incrementDigit(int index) {
    setState(() {
      guess[index] = (guess[index] + 1) % 10;
    });
  }

  void decrementDigit(int index) {
    setState(() {
      guess[index] = (guess[index] - 1 + 10) % 10;
    });
  }

  Widget buildDigitColumn(int index) {
    return Column(
      children: [
        IconButton(
          icon: Icon(Icons.arrow_drop_up, size: 60),
          onPressed: () => incrementDigit(index),
        ),
        Text('${guess[index]}', style: TextStyle(fontSize: 60)),
        IconButton(
          icon: Icon(Icons.arrow_drop_down, size: 60),
          onPressed: () => decrementDigit(index),
        ),
      ],
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        title: RichText(
          text: TextSpan(
            style: const TextStyle(fontSize: 26, color: Colors.white),
            children: <TextSpan>[const TextSpan(text: 'Guess the number')],
          ),
        ),
        actions: [
          PopupMenuButton<String>(
            onSelected: (value) {
              if (value == 'sair') Navigator.pop(context);
              if (value == 'recomeçar') {
                setState(() {
                  targetNumber = Random().nextInt(1000);
                  guess = [0, 0, 0];
                  attempts = 0;
                  message = 'Dê um palpite...';
                  icon = Icons.help_outline;
                });
              }
              if (value == 'meu perfil') {
                print("Navegando para MyProfile");
                Navigator.of(context).pushNamed('/myProfile');
              }
            },
            itemBuilder:
                (context) => [
                  PopupMenuItem(value: 'meu perfil', child: Text('Meu perfil')),
                  PopupMenuItem(value: 'recomeçar', child: Text('Reiniciar')),
                  PopupMenuItem(value: 'sair', child: Text('Sair')),
                ],
          ),
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(vertical: 24.0),
        child: Column(
          children: [
            Column(
              children: [
                SizedBox(
                  height: 360,
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      CircleAvatar(
                        radius: 140,
                        backgroundColor: Color.fromARGB(255, 179, 179, 179),
                        child: Icon(icon, size: 150, color: Colors.white),
                      ),
                      Text(
                        message,
                        style: TextStyle(color: Colors.white, fontSize: 30),
                      ),
                      SizedBox(height: 10),
                    ],
                  ),
                ),
                Container(
                  padding: const EdgeInsets.symmetric(
                    horizontal: 120,
                    vertical: 22,
                  ),
                  height: 120,
                  width: MediaQuery.of(context).size.width,
                  color: Color.fromARGB(255, 50, 50, 50),
                  child: Container(
                    decoration: BoxDecoration(
                      color: Color.fromARGB(255, 28, 28, 28),
                      border: Border.all(color: Colors.white),
                      borderRadius: BorderRadius.circular(10),
                    ),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(
                          'TENTATIVAS\n$attempts',
                          style: TextStyle(color: Colors.white),
                          textAlign: TextAlign.center,
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                buildDigitColumn(0),
                SizedBox(width: 10),
                buildDigitColumn(1),
                SizedBox(width: 10),
                buildDigitColumn(2),
              ],
            ),
            ElevatedButton(
              onPressed: attempts >= 0 ? checkGuess : null,
              style: ElevatedButton.styleFrom(
                padding: EdgeInsets.symmetric(horizontal: 32, vertical: 12),
              ),
              child: Text('Palpite', style: TextStyle(fontSize: 20)),
            ),
          ],
        ),
      ),
    );
  }
}
