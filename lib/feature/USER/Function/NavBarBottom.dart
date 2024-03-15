import 'package:flutter/material.dart';
import 'package:google_nav_bar/google_nav_bar.dart';
import 'package:citizen/feature/USER/presentation/Homepage/HomePage.dart';
import 'package:citizen/feature/USER/presentation/Homepage/ProfilePage.dart';
import 'package:citizen/feature/USER/presentation/Homepage/NewsPage.dart';

class NavBarBt extends StatefulWidget {
  const NavBarBt({super.key});

  @override
  State<NavBarBt> createState() => _NavBarBtState();
}

int MyIndex = 0;
List pages = [HomePage(),NewsPage(),ProfilePage()];


class _NavBarBtState extends State<NavBarBt> {
  @override
  Widget build(BuildContext context) {
    Widget bottomNavbar = BottomNavigationBar(
      currentIndex: MyIndex,
      onTap: (int index){
        setState(() {
          MyIndex = index;
        });
      },
      items: [
        BottomNavigationBarItem(icon: Icon(Icons.home_filled)),
        BottomNavigationBarItem(icon: Icon(Icons.newspaper)),
        BottomNavigationBarItem(icon: Icon(Icons.account_circle))
      ]);

    return  Scaffold(
      body: pages[MyIndex],
      bottomNavigationBar: bottomNavbar,
    );
  }
}
