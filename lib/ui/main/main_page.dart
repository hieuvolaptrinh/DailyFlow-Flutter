import 'package:flutter/material.dart';

class MainPage extends StatefulWidget {
  const MainPage({super.key});

  @override
  State<MainPage> createState() => _MainPageState();
}

class _MainPageState extends State<MainPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFF121212),
      body: Container(),
      bottomNavigationBar: BottomNavigationBar(
        backgroundColor: const Color(0xFF1E1E1E),
        items: [
          BottomNavigationBarItem(
            icon: Image.asset(
              "assets/images/home-2.png",
              width: 24,
              height: 24,
              fit: BoxFit.fill,
            ),
            label: "Index",
          ),

          BottomNavigationBarItem(
            icon: Image.asset(
              "assets/images/calendar.png",
              width: 24,
              height: 24,
              fit: BoxFit.fill,
            ),
            label: "Calendar",
          ),
          BottomNavigationBarItem(
            icon: Image.asset(
              "assets/images/clock.png",
              width: 24,
              height: 24,
              fit: BoxFit.fill,
            ),
            label: "Focus",
          ),
          BottomNavigationBarItem(
            icon: Image.asset(
              "assets/images/user.png",
              width: 24,
              height: 24,
              fit: BoxFit.fill,
            ),
            label: "Profile",
          ),
        ],
      ),
    );
  }
}
