
import 'package:flutter/material.dart';
import 'package:tech_dunkers/screens/home_page.dart';

class BottomNavBar extends StatefulWidget {
  const BottomNavBar({Key? key}) : super(key: key);

  @override
  State<BottomNavBar> createState() => _BottomNavBarState();
}

class _BottomNavBarState extends State<BottomNavBar> {

  int currentIndx = 0;
  List pages = const [HomePage()];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: pages[currentIndx],
        bottomNavigationBar: BottomNavigationBar(
          onTap: (v) {
            setState(() {
              currentIndx = v;
            });
          },
          elevation: 0,
          backgroundColor: const Color(0xff09203f),
          currentIndex: currentIndx,
          items: const [
            BottomNavigationBarItem(icon: Icon(Icons.home), label: "Home"),
          ],
        )
    );
  }
}