import 'package:flutter/material.dart';
import 'package:google_nav_bar/google_nav_bar.dart';
import 'package:citizen/feature/USER/Function/Drawer.dart';

class ContactPage extends StatelessWidget {
  const ContactPage({super.key});

  @override
  Widget build(BuildContext context) {
    return  Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(title: Center(child:Image(image: AssetImage ('assets/image/citizenicon.png'),width: 50,)),
        backgroundColor: Color.fromRGBO(68, 117, 182, 1.0),
      ),
      drawer: MyDrawer(),
      bottomNavigationBar: GNav(
        backgroundColor: Color.fromRGBO(68, 117, 182, 1.0),
        color: Colors.white,
        activeColor: Colors.white,
        tabBackgroundColor: Color.fromRGBO(219, 226, 239, 100),
        padding: EdgeInsets.all(16),
        tabs:  [
          GButton(icon: Icons.home, text: 'Home',onPressed:(){ Navigator.pushNamed(context,'/homepage');},) ,
          GButton (icon: Icons.newspaper, text: 'News',onPressed:(){ Navigator.pushNamed(context,'/newspage');},),
          GButton(icon: Icons.notifications_active, text: 'Notification',onPressed:(){ Navigator.pushNamed(context,'/notipage');},),
        ],
      ),
      body: ListView(
          children: [
      Padding(padding: const EdgeInsets.only(left: 25.0),
      child: Text(
        'Contact',
        style: TextStyle(color:Colors.black ,fontSize: 25),
      ) ,

    ), Center(
        child: Container(
          width: 400,
        height: 300,
        decoration: BoxDecoration(
            color: Colors.grey[200],
          borderRadius: BorderRadius.circular(8),
            ),
        padding: EdgeInsets.all(30),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                'ที่อยู่: 5/292หมู่ที่5 เขตบางแค แขวงบางแค'
              ),
              Text(
                  'Facebook: citizen complaint'
              ),Text(
                  'line: @citizen complaint'
              ),
              Text(
                  'เบอร์: 08-75921793,02-5522354'
              ),

            ],
          ),

             ),
      ),
          ],
          )
    );
  }
}
