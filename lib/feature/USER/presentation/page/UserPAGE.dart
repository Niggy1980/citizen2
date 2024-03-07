import 'package:flutter/material.dart';

class MainUserPage extends StatelessWidget {
  const MainUserPage({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        body: Column(
          children: [
            Text("Userpage")
          ],
        ),
      ),
    );
  }
}
