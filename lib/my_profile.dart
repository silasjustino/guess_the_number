// lib/my_profile.dart

import 'package:flutter/material.dart';
import 'package:guess_the_number/models/singleton.dart';

class MyProfile extends StatefulWidget {
  const MyProfile({super.key});

  @override
  State<MyProfile> createState() => _MyProfileState();
}

class _MyProfileState extends State<MyProfile> {
  final singleton = Singleton.instance;

  @override
  void initState() {
    super.initState();
    singleton.recorde.addListener(_onRecordeChange);
  }

  void _onRecordeChange() {
    setState(() {}); // reconstrói o widget quando o recorde mudar
  }

  @override
  void dispose() {
    singleton.recorde.removeListener(_onRecordeChange);
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final recorde = singleton.recorde.value;

    return Scaffold(
      appBar: AppBar(
        title: const Text('Meu Perfil'),
        leading: IconButton(
          icon: const Icon(Icons.arrow_back),
          onPressed: () => Navigator.pop(context),
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Center(
              child: CircleAvatar(
                radius: 50,
                backgroundColor: Colors.blue,
                child: Icon(Icons.person, size: 50, color: Colors.white),
              ),
            ),
            const SizedBox(height: 20),
            Center(
              child: Column(
                children: [
                  const SizedBox(height: 20),
                  Text(
                    "Email: ${singleton.email}",
                    style: TextStyle(fontSize: 20),
                  ),
                  const SizedBox(height: 20),
                  Text(
                    "Melhor jogada: ${recorde == -1 ? "Não houve" : recorde}",
                    style: TextStyle(fontSize: 20),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
