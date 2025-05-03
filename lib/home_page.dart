import 'package:flutter/material.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  var nome = "Silas";

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        title: RichText(
          text: TextSpan(
            style: const TextStyle(fontSize: 20, color: Colors.white),
            children: <TextSpan>[
              const TextSpan(text: 'Bem vindo, '),
              TextSpan(
                text: '$nome!',
                style: const TextStyle(color: Colors.blue),
              ),
            ],
          ),
        ),
        actions: <Widget>[
          IconButton(
            icon: const Icon(Icons.add_alert_outlined),
            onPressed: () {},
          ),
          SizedBox(
            width: 60,
            child: Stack(
              children: [
                Positioned.fill(
                  child: Container(
                    width: 50,
                    decoration: BoxDecoration(
                      color: Colors.grey,
                      borderRadius: BorderRadius.circular(50),
                    ),
                    child: const Center(child: Icon(Icons.abc)),
                  ),
                ),
                Positioned.fill(
                  child: InkWell(
                    borderRadius: BorderRadius.circular(50),
                    onTap: () {},
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
      body: Stack(),
      bottomNavigationBar: const Stack(),
    );
  }
}
