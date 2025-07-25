import 'package:flutter/material.dart';
import 'package:taskbygithub/home/home_page.dart';
import 'package:taskbygithub/profile/profile_page/profile_page.dart';
import 'package:taskbygithub/quotes/quote_view.dart';

import '../timer/timer_view.dart';

class NavBar extends StatefulWidget {
  const NavBar({super.key});

  @override
  State<NavBar> createState() => _NavBarState();
}

class _NavBarState extends State<NavBar> {
  int currentIndex = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: [
        HomePage(),
        TimerScreen(),
        QuoteView(),
        ProfilePage(),
      ][currentIndex],
      bottomNavigationBar: NavigationBar(
        destinations: [
          NavigationDestination(icon: Icon(Icons.home), label: "Home"),
          NavigationDestination(icon: Icon(Icons.timer), label: "Timer "),
          NavigationDestination(
              icon: Icon(Icons.format_quote), label: "dashboard"),
          NavigationDestination(icon: Icon(Icons.person), label: "Profile"),
        ],
        selectedIndex: currentIndex,
        onDestinationSelected: (index) {
          setState(() {
            currentIndex = index;
          });
        },
      ),
    );
  }
}
