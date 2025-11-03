import 'package:flutter/material.dart';

class MainPage extends StatefulWidget {
  const MainPage({super.key});

  @override
  State<MainPage> createState() => _MainPageState();
}

class _MainPageState extends State<MainPage> {
  List<Widget> pages = [];

  int _currentPage = 0;

  @override
  void initState() {
    super.initState();
    pages = [
      Container(color: Colors.red),
      Container(color: Colors.green),
      Container(),
      Container(color: Colors.blue),
      Container(color: Colors.yellow),
    ];
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFF121212),
      body: pages.elementAt(_currentPage),
      bottomNavigationBar: BottomNavigationBar(
        backgroundColor: const Color(0xFF121212),
        unselectedItemColor: Colors.white,
        selectedItemColor: const Color(0XFF8687E7),
        type: BottomNavigationBarType.fixed,
        currentIndex:
            _currentPage, // index hiện tại của thằng BottomNavigationBar
        onTap: (index) {
          if (index != 2) {
            setState(() {
              _currentPage = index;
            });
          }
        },
        items: [
          BottomNavigationBarItem(
            icon: Image.asset(
              "assets/images/home-2.png",
              width: 24,
              height: 24,
              fit: BoxFit.fill,
            ),
            activeIcon: Image.asset(
              "assets/images/home-2.png",
              width: 24,
              height: 24,
              fit: BoxFit.fill,
              color: const Color(0XFF8687E7),
            ),
            label: "Index",
          ),

          BottomNavigationBarItem(
            backgroundColor: const Color(0xFF121212),
            icon: Image.asset(
              "assets/images/calendar.png",
              width: 24,
              height: 24,
              fit: BoxFit.fill,
            ),
            activeIcon: Image.asset(
              "assets/images/calendar.png",
              width: 24,
              height: 24,
              fit: BoxFit.fill,
              color: const Color(0XFF8687E7),
            ),
            label: "Calendar",
          ),
          BottomNavigationBarItem(icon: Container(), label: ""),
          BottomNavigationBarItem(
            icon: Image.asset(
              "assets/images/clock.png",
              width: 24,
              height: 24,
              fit: BoxFit.fill,
            ),
            activeIcon: Image.asset(
              "assets/images/clock.png",
              width: 24,
              height: 24,
              fit: BoxFit.fill,
              color: const Color(0XFF8687E7),
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
            activeIcon: Image.asset(
              "assets/images/user.png",
              width: 24,
              height: 24,
              fit: BoxFit.fill,
              color: const Color(0XFF8687E7),
            ),
            label: "Profile",
          ),
        ],
      ),
      floatingActionButton: Container(
        width: 64,
        height: 64,
        // decoration dùng để trang trí cho container
        decoration: BoxDecoration(
          color: Color(0XFF8687E7),
          borderRadius: BorderRadius.circular(32),
        ),
        child: IconButton(
          onPressed: () {
            setState(() {
              _currentPage = 2;
            });
          },
          icon: Icon(Icons.add, size: 30, color: Colors.white),
        ),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
    );
  }
}
