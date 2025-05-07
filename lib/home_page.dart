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
            style: const TextStyle(fontSize: 26, color: Colors.white),
            children: <TextSpan>[const TextSpan(text: 'Guess the number')],
          ),
        ),
        actions: <Widget>[
          SizedBox(
            width: 60,
            child: Stack(
              children: [
                Positioned.fill(
                  child: SizedBox(
                    width: 50,
                    child: const Center(child: Icon(Icons.menu)),
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
      body: Stack(
        children: [
          Container(
            width: MediaQuery.of(context).size.width,
            height: MediaQuery.of(context).size.height,
            color: const Color.fromARGB(255, 255, 255, 255),
          ),
        ],
      ),
      bottomNavigationBar: const Stack(),
    );
  }
}
