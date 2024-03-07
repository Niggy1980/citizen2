import 'package:citizen/feature/USER/Function/Drawer.dart';
import 'package:citizen/feature/USER/Function/TextBox.dart';
import 'package:flutter/material.dart';
import 'package:google_nav_bar/google_nav_bar.dart';



class ProfilePage extends StatefulWidget {
  const ProfilePage({super.key});

  @override
  State<ProfilePage> createState() => _ProfilePageState();
}

class _ProfilePageState extends State<ProfilePage> {
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
      body: ListView(
        children: [
          const SizedBox(height: 50),
          //profilepic
          const Icon(
            Icons.person,
            size: 120,
          ),
          const SizedBox(height: 20),
          //useremail
          Text("poonnawit@gmail.com",
              textAlign: TextAlign.center,
              style:TextStyle(color: Colors.black)),
          const SizedBox(height: 50),
          //userdetail
          Padding(padding: const EdgeInsets.only(left: 25.0),
            child: Text(
              'Mydetail',
              style: TextStyle(color:Colors.black ),
            ) ,
          ),

          //username

          MyTextBox(text: 'punnawit', sectionName: 'username',),

          MyTextBox(text: '25/08/02', sectionName: 'datebirthday',),

          MyTextBox(text: '1206598451222', sectionName: 'idenityID',),
        ],
      ),
    );
  }
}
