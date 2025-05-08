// lib/my_profile.dart

import 'package:flutter/material.dart';
import 'package:guess_the_number/models/singleton.dart';

class MyProfile extends StatelessWidget {
  MyProfile({super.key});

  final singleton = Singleton.instance;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Meu Perfil'),
        leading: IconButton(
          icon: const Icon(Icons.arrow_back),
          onPressed: () {
            Navigator.pop(context);
          },
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            Center(
              child: const CircleAvatar(
                radius: 50,
                backgroundColor: Colors.blue,
                child: Icon(Icons.person, size: 50, color: Colors.white),
              ),
            ),
            const SizedBox(height: 20),
            Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                const SizedBox(height: 20),
                Text(
                  "Email: ${singleton.email}",
                  style: TextStyle(fontSize: 20),
                ),
                const SizedBox(height: 20),
                ValueListenableBuilder(
                  valueListenable: singleton.recorde,
                  builder: (BuildContext context, value, Widget? child) {
                    return Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text("Melhor jogada: ", style: TextStyle(fontSize: 20)),
                        Text(
                          "${value == -1 ? "Não houve" : value}",
                          style: TextStyle(fontSize: 20),
                        ),
                      ],
                    );
                  },
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
