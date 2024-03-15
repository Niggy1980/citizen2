import 'package:citizen/feature/USER/Function/Drawer.dart';
import 'package:flutter/material.dart';
import 'package:citizen/feature/USER/presentation/Homepage/ProfilePage.dart';
import 'package:citizen/feature/USER/Function/Drawer.dart';
import 'package:citizen/feature/USER/presentation/page/LOGINPAGE.dart';
import 'package:citizen/feature/USER/presentation/Homepage/HomePage.dart';
class NewsPage extends StatefulWidget {
  const NewsPage({super.key});

  @override
  State<NewsPage> createState() => _NewsPageState();
}

int MyIndex = 0;
List pages = [HomePage(),NewsPage(),ProfilePage()];

class _NewsPageState extends State<NewsPage> {
  @override
  Widget build(BuildContext context) {

    return Scaffold(


      body: Container(
        child: Card(
          child: Icon(Icons.ice_skating),
        ),
      ),
    );
  }
}
