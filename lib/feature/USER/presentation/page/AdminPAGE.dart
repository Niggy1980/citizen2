import 'package:flutter/material.dart';


class MainAdminPage extends StatelessWidget {
  const MainAdminPage({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        body: Center(
          child: Text("admin",style: TextStyle(color: Colors.blue,fontSize: 50,fontWeight: FontWeight.bold),),
        ),
      ),
    );
  }
}
