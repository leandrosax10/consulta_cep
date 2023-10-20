import 'package:flutter/material.dart';
import 'package:animated_text_kit/animated_text_kit.dart';
import '../consulta_cep.dart';

class SplashScreenPage extends StatefulWidget {
  const SplashScreenPage({super.key});

  @override
  State<SplashScreenPage> createState() => _SplashScreenPageState();
}

class _SplashScreenPageState extends State<SplashScreenPage> {
  openHome() {
    Future.delayed(const Duration(seconds: 2), () {
      Navigator.pushReplacement(context,
          MaterialPageRoute(builder: (builder) => const ConsultaCEP()));
    });
  }

//Animação
  var colorizeColors = [
    Colors.purple,
    Colors.blue,
    Colors.yellow,
    Colors.red,
  ];

  var colorizeTextStyle = const TextStyle(
    fontSize: 40.0,
    fontFamily: 'Horizon',
  );
//fim Animação

  @override
  Widget build(BuildContext context) {
    openHome();
    return SafeArea(
      child: Scaffold(
        //degrade
        body: Container(
          decoration: const BoxDecoration(
            gradient: LinearGradient(
                begin: Alignment.topCenter,
                end: Alignment.bottomCenter,
                colors: [
                  Color.fromARGB(255, 230, 240, 230),
                  Color.fromARGB(255, 5, 71, 126)
                ],
                stops: [
                  0.3,
                  0.9
                ]),
          ),
          //degrade
          child: Center(
            //Animação

            child: SizedBox(
              width: 200.0,
              child: AnimatedTextKit(
                animatedTexts: [
                  ColorizeAnimatedText(
                    'Consulta de CEP',
                    textStyle: colorizeTextStyle,
                    colors: colorizeColors,
                    textAlign: TextAlign.center,
                  ),
                ],
                totalRepeatCount: 1,
                onTap: () {
                  print("Tap Event");
                },
              ),
            ),
          ),
        ),
      ),
    );
  }
}
