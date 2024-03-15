import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

final CollectionReference account = FirebaseFirestore.instance.collection('image');

class News extends StatelessWidget {
  const News({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(title: Center(child:Image(image: AssetImage ('assets/image/citizenicon.png'),width: 50,)),
          backgroundColor: Color.fromRGBO(68, 117, 182, 1.0),
        ),
        body: Column(
          children: [
            SizedBox(height: 20,
            ),
          ],
        ),
      ),
    );
  }
}
