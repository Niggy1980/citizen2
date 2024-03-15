import 'package:citizen/feature/USER/Function/Drawer.dart';
import 'package:citizen/feature/USER/presentation/page/Newpage.dart';
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
List<Widget> widgetList = const[
  HomePage(),
  NewsPage(),
  ProfilePage(),
];


class _NavBarBtState extends State<NavBarBt> {
  @override
  Widget build(BuildContext context) {
    return  Scaffold(
      drawer: MyDrawer(),
      bottomNavigationBar: GNav(
        backgroundColor: Color.fromRGBO(68, 117, 182, 1.0),
    color: Colors.white,
    activeColor: Colors.white,
    padding: EdgeInsets.all(16),
    onTabChange: (index){
          setState(() {
            MyIndex = index;
          });
    },
    tabs: const  [
    GButton(icon: Icons.home, text: 'Home'),
    GButton(icon: Icons.newspaper, text: 'News'),
    GButton(icon: Icons.account_circle, text: 'Profile'),
    ],
    ),
      body: widgetList[MyIndex],
    );
  }
}
