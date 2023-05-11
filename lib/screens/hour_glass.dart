import 'package:circular_countdown_timer/circular_countdown_timer.dart';
import 'package:flutter/material.dart';

class HourGlass extends StatefulWidget {
  const HourGlass({
    super.key,
    required this.tiempo,
    required this.incremento,
  });

  final int tiempo;
  final int incremento;

  @override
  State<HourGlass> createState() => _HourGlassState();
}

class _HourGlassState extends State<HourGlass> {
  final CountDownController _controllerBlancas = CountDownController();
  final CountDownController _controllerNegras = CountDownController();

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    int jugadasBlancas = 0;
    int jugadasNegras = 0;
    bool isReverseWhite = true;
    bool isReverseBlack = true;

    return Scaffold(
      body: Column(
        children: [
          RotatedBox(
            quarterTurns: 2,
            child: GestureDetector(
              onTap: () {
                if (jugadasNegras == 1) {
                  _controllerNegras.start();
                }
                jugadasBlancas++;
              },
              child: Container(
                width: size.width,
                height: size.height * 0.4,
                margin: const EdgeInsets.all(10),
                decoration: BoxDecoration(
                  color: Colors.grey,
                  borderRadius: BorderRadius.circular(20),
                ),
                child: CircularCountDownTimer(
                  controller: _controllerBlancas,
                  autoStart: false,
                  isReverse: isReverseWhite,
                  duration: widget.tiempo * 60,
                  fillColor: Colors.transparent,
                  height: 50,
                  width: 50,
                  ringColor: Colors.transparent,
                  textFormat: CountdownTextFormat.MM_SS,
                  textStyle: const TextStyle(
                    color: Colors.white,
                    fontWeight: FontWeight.bold,
                    fontSize: 50,
                  ),
                ),
              ),
            ),
          ),
          SizedBox(
            width: size.width,
            height: size.height * 0.1,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                IconButton(
                  onPressed: () => Navigator.pop(context),
                  icon: const Icon(
                    Icons.home,
                  ),
                ),
                IconButton(
                  onPressed: () {},
                  icon: const Icon(
                    Icons.play_arrow,
                  ),
                ),
                IconButton(
                  onPressed: () {},
                  icon: const Icon(
                    Icons.refresh,
                  ),
                ),
              ],
            ),
          ),
          GestureDetector(
            onTap: () {
              if (jugadasBlancas == 0) {
                _controllerBlancas.start();
              }
              jugadasNegras++;
            },
            child: Container(
              width: size.width,
              height: size.height * 0.4,
              margin: const EdgeInsets.all(10),
              decoration: BoxDecoration(
                color: Colors.grey,
                borderRadius: BorderRadius.circular(20),
              ),
              child: CircularCountDownTimer(
                controller: _controllerNegras,
                autoStart: false,
                isReverse: isReverseBlack,
                duration: widget.tiempo * 60,
                fillColor: Colors.transparent,
                height: 50,
                width: 50,
                ringColor: Colors.transparent,
                textFormat: CountdownTextFormat.MM_SS,
                textStyle: const TextStyle(
                  color: Colors.white,
                  fontWeight: FontWeight.bold,
                  fontSize: 50,
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
