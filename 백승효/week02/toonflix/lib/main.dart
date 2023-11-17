import 'package:flutter/material.dart';

class Player {
  String? name = "seunghyo";
  Player();
}

void main() {
  var seunghyo = Player();
  runApp(const App());
}

class App extends StatelessWidget {
  const App({super.key});

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: const Text("Hello Flutter"),
        ),
        body: const Center(
          child: Text("Hello world"),
        ),
      ),
    );
  }
}
