import 'package:flutter/material.dart';
import 'package:google_nav_bar/google_nav_bar.dart';

class NavBarBt extends StatefulWidget {
  const NavBarBt({super.key});

  @override
  State<NavBarBt> createState() => _NavBarBtState();
}

class _NavBarBtState extends State<NavBarBt> {
  @override
  Widget build(BuildContext context) {
    return  Scaffold(
      bottomNavigationBar: GNav(
        backgroundColor: Colors.blue,color:Colors.white ,activeColor: Colors.white,tabBackgroundColor: Colors.blue.shade200,
        padding: EdgeInsets.all(16),
        tabs: const [
          GButton(icon: Icons.home,
                  text:'Home'),
          GButton(icon: Icons.newspaper,
                  text:'News'),
          GButton(icon: Icons.person,
                  text:'Profile'),

        ],
      ),
    );
  }
}
