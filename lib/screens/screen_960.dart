import 'dart:math';

import 'package:flutter/material.dart';

class Screen960 extends StatefulWidget {
  const Screen960({super.key});

  @override
  State<Screen960> createState() => Screen960State();
}

class Screen960State extends State<Screen960> {
  List<dynamic> posicion = ['A', 'C', 'C', 'A', 'T', 'D', 'T', 'R'];
  Map<int, String> finalPosicion = {
    0: 'A',
    1: 'A',
    2: 'C',
    3: 'C',
    4: 'T',
    5: 'T',
    6: 'D',
    7: 'R',
  };

  String generateRandomString(int len) {
    var r = Random();
    const _chars = 'AACCTTDR';
    return List.generate(len, (index) => _chars[r.nextInt(_chars.length)])
        .join();
  }

  @override
  Widget build(BuildContext context) {
    for (var i = 0; i < 8; i++) {
      //var aleatorio = Random().n;
      //posicion[i] = aleatorio.toString();
    }

    return Scaffold(
      body: Center(
        child: Text('$posicion'),
      ),
    );
  }
}
