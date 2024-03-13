import 'package:citizen/feature/USER/Function/Drawer.dart';
import 'package:citizen/feature/USER/Function/NavBarBottom.dart';
import 'package:flutter/material.dart';
import 'package:google_nav_bar/google_nav_bar.dart';

class NewsPage extends StatelessWidget {

  NewsPage({super.key});

  @override
  Widget build(BuildContext context) {


    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
<<<<<<< HEAD
        title: Center(child:Image(image: AssetImage ('assets/image/citizenicon.png'),width: 50,)),
=======
        title: Center(child: Image(
          image: AssetImage('assets/image/citizenicon.png'), width: 50,)),
>>>>>>> 2058806eaf3bfde7fb5484eea8d6a24bf1341b96
        backgroundColor: Color.fromRGBO(68, 117, 182, 1.0),
      ),
      drawer: MyDrawer(),
      bottomNavigationBar: GNav(
        backgroundColor: Color.fromRGBO(68, 117, 182, 1.0),
        color: Colors.white,
        activeColor: Colors.white,
        padding: EdgeInsets.all(16),
        tabs:  [
<<<<<<< HEAD
          GButton(icon: Icons.home, text: 'Home',onPressed:(){ Navigator.pushNamed(context,'/homepage');},) ,
          GButton (icon: Icons.newspaper, text: 'News',onPressed:(){ Navigator.pushNamed(context,'/newspage');},),
          GButton(icon: Icons.notifications_active, text: 'Notification',onPressed:(){ Navigator.pushNamed(context,'/notipage');},),
=======
          GButton(icon: Icons.home, text: 'Home',onPressed:(){ Navigator.pushNamed(context,'/homepage');},),
          GButton(icon: Icons.newspaper, text: 'News',onPressed:(){ Navigator.pushNamed(context,'/newspage');},),
          GButton(icon: Icons.account_circle, text: 'Profile',onPressed:(){ Navigator.pushNamed(context,'/profilepage');},),
>>>>>>> 2058806eaf3bfde7fb5484eea8d6a24bf1341b96
        ],

      ),

    );
  }
}
