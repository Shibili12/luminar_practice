import 'dart:async';

import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:luminar_practice/loginscreen.dart';

class Splashscreen extends StatefulWidget {
  const Splashscreen({super.key});

  @override
  State<Splashscreen> createState() => _SplashscreenState();
}

class _SplashscreenState extends State<Splashscreen> {
  @override
  void initState() {
    Timer(Duration(seconds: 5), () {
      Navigator.of(context).pushReplacement(
          MaterialPageRoute(builder: (context) => Loginscreen()));
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      body: Container(
        child: Stack(
          children: [
            Positioned(
              top: 400,
              left: 160,
              child: ShaderMask(
                blendMode: BlendMode.srcIn,
                shaderCallback: (Rect bounds) => LinearGradient(
                  begin: Alignment.topLeft,
                  end: Alignment.bottomLeft,
                  // stops: [1, 2, 3, 4],
                  colors: [
                    Colors.purple,
                    Colors.pink,
                    Colors.red,
                    Colors.orange,
                  ],
                ).createShader(bounds),
                child: FaIcon(
                  FontAwesomeIcons.instagram,
                  size: 90,
                ),
              ),
            ),
            Positioned(
              bottom: 100,
              left: 190,
              child: Text(
                "from",
                style: TextStyle(
                    color: const Color.fromARGB(136, 255, 255, 255),
                    fontSize: 17),
              ),
            ),
            Positioned(
              bottom: 80,
              left: 170,
              child: ShaderMask(
                blendMode: BlendMode.srcIn,
                shaderCallback: (Rect bounds) => LinearGradient(
                  begin: Alignment.topLeft,
                  end: Alignment.bottomLeft,
                  // stops: [1, 2, 3, 4],
                  colors: [
                    Colors.purple,
                    Colors.pink,
                    Colors.red,
                    Colors.orange,
                  ],
                ).createShader(bounds),
                child: FaIcon(
                  FontAwesomeIcons.meta,
                  size: 20,
                ),
              ),
            ),
            Positioned(
              bottom: 78,
              left: 200,
              child: ShaderMask(
                blendMode: BlendMode.srcIn,
                shaderCallback: (Rect bounds) => LinearGradient(
                  begin: Alignment.topLeft,
                  end: Alignment.bottomLeft,
                  // stops: [1, 2, 3, 4],
                  colors: [
                    Colors.purple,
                    Colors.pink,
                    Colors.red,
                    Colors.orange,
                  ],
                ).createShader(bounds),
                child: Text(
                  "Meta",
                  style: TextStyle(
                    // color: const Color.fromARGB(136, 255, 255, 255),
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
