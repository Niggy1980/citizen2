import 'package:flutter/material.dart';
import 'package:google_nav_bar/google_nav_bar.dart';
import 'package:citizen/feature/USER/Function/Drawer.dart';

class ContactPage extends StatelessWidget {
  const ContactPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.white,
        appBar: AppBar(
          title: Center(
              child: Image(
            image: AssetImage('assets/image/citizenicon.png'),
            width: 50,
          )),
          backgroundColor: Color.fromRGBO(68, 117, 182, 1.0),
        ),
        drawer: MyDrawer(),
        bottomNavigationBar: GNav(
          backgroundColor: Color.fromRGBO(68, 117, 182, 1.0),
          color: Colors.white,
          activeColor: Colors.white,
          padding: EdgeInsets.all(16),
          tabs: [
            GButton(
              icon: Icons.home,
              text: 'Home',
              onPressed: () {
                Navigator.pushNamed(context, '/homepage');
              },
            ),
            GButton(
              icon: Icons.newspaper,
              text: 'News',
              onPressed: () {
                Navigator.pushNamed(context, '/newspage');
              },
            ),
            GButton(
              icon: Icons.account_circle,
              text: 'Profile',
              onPressed: () {
                Navigator.pushNamed(context, '/profilepage');
              },
            ),
          ],
        ),
        body: ListView(
          children: [
            Padding(
              padding: const EdgeInsets.only(left: 25.0, top: 10),
              child: Text(
                'Contact',
                style: TextStyle(color: Colors.black, fontSize: 25),
              ),
            ),
            Container(
              decoration: BoxDecoration(
                color: Colors.grey[300],
                borderRadius: BorderRadius.circular(8),
              ),
              padding: EdgeInsets.only(left: 15, bottom: 15, top: 10),
              margin: EdgeInsets.only(left: 200, right: 200, top: 20),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Text("5/292หมู่ที่5 เขตบางแค แขวงบางแค", style: TextStyle(fontSize: 15),),
                  Text("Facebook citizen complaint", style: TextStyle(fontSize: 15),),
                  Text('line @citizen complaint', style: TextStyle(fontSize: 15),),
                  Text('โทร 08-75921793, 02-5522354', style: TextStyle(fontSize: 15),),
                ],
              ),
            )
          ],
        )
    );
  }
}
