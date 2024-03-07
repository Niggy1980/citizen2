import 'package:citizen/feature/USER/Function/TextBox.dart';
import 'package:flutter/material.dart';
import 'package:citizen/feature/USER/Function/Drawer.dart';
import 'package:google_nav_bar/google_nav_bar.dart';


class NotiPage extends StatelessWidget {
  const NotiPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      drawer: MyDrawer(),
      bottomNavigationBar: GNav(
        backgroundColor: Color.fromRGBO(68, 117, 182, 1.0),
        color: Colors.white,
        activeColor: Colors.white,
        tabBackgroundColor: Color.fromRGBO(219, 226, 239, 100),
        padding: EdgeInsets.all(16),
        tabs:  [
          GButton(icon: Icons.home, text: 'Home',onPressed:(){ Navigator.pushNamed(context,'/homepage');},),
          GButton(icon: Icons.newspaper, text: 'News',onPressed:(){ Navigator.pushNamed(context,'/newspage');},),
          GButton(icon: Icons.notifications_active, text: 'Notification',onPressed:(){ Navigator.pushNamed(context,'/notipage');},),
        ],
      ),
      appBar: AppBar(
        title: Center (child:Image(image: AssetImage ('assets/image/citizenicon.png'),width: 50,)),
        backgroundColor: Color.fromRGBO(68, 117, 182, 1.0),
      ),
      body: (
      ListView(
        children: [
          Padding(padding: const EdgeInsets.only(left: 25.0),
            child: Text(
              'Notifications',
              style: TextStyle(color:Colors.black ,fontSize: 25),
            ) ,
          ),
          
          MyTextBox(text: 'ท่อแตก', sectionName: 'ฟิว'),
          MyTextBox(text: 'ทางเดินชำรุด', sectionName: 'ปุ่น'),
        ],
      )
      ),

    );
  }
}
