import 'dart:async';

import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../widgets/bottom_navbar.dart';
import 'login_page.dart';
import 'dart:math' as math;

class SplashScreen extends StatefulWidget {
  const SplashScreen({Key? key}) : super(key: key);

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

bool finalValue = false;

class _SplashScreenState extends State<SplashScreen>
    with TickerProviderStateMixin {
  late final AnimationController controller;

  @override
  void initState() {
    super.initState();
    controller =
        AnimationController(vsync: this, duration: const Duration(seconds: 3))
          ..repeat();
    getRememberMePreference().whenComplete(() async {
      Timer(const Duration(seconds: 3), () {
        Navigator.pushReplacement(context,
            MaterialPageRoute(builder: (context) {
          return finalValue == false
              ? const LoginScreen()
              : const BottomNavBar();
        }));
      });
    });
  }

  @override
  void dispose() {
    controller.dispose();
    super.dispose();
  }

  // To retrieve the "Remember Me" preference
  Future getRememberMePreference() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    var obtainedValue = prefs.getBool('rememberMe');
    setState(() {
      finalValue = obtainedValue!;
    });
  }

  @override
  Widget build(BuildContext context) {
    Size mq = MediaQuery.of(context).size;

    return Scaffold(
      body: SizedBox(
        height: double.infinity,
        width: double.infinity,
        child: AnimatedBuilder(
          animation: controller,
          builder: (BuildContext context, Widget? child) {
            return Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Transform.rotate(
                    angle: controller.value * 2.0 * math.pi,
                    child: SizedBox(
                      height: mq.height * .3,
                      width: mq.height * .3,
                      child: const ClipRRect(
                          borderRadius: BorderRadius.all(Radius.circular(11)),
                          child: Image(image: AssetImage("assets/hub.png"))),
                    ),
                  ),
                  const Padding(padding: EdgeInsets.all(11.0)),
                  Text(
                    "MovieZ",
                    style: TextStyle(
                        fontSize: mq.width * .2,
                        color: Colors.red,
                        fontWeight: FontWeight.w500),
                  )
                ],
              ),
            );
          },
        ),
      ),
    );
  }
}
