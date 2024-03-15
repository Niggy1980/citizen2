import 'package:citizen/feature/USER/presentation/Homepage/ContactPage.dart';
import 'package:citizen/feature/USER/presentation/Homepage/FAQPage.dart';
import 'package:citizen/feature/USER/presentation/Homepage/HomePage.dart';
import 'package:citizen/feature/USER/presentation/Homepage/NewsPage.dart';
import 'package:citizen/feature/USER/presentation/Homepage/ProfilePage.dart';
import 'package:citizen/feature/USER/presentation/page/LOGINPAGE.dart';
import 'package:flutter/material.dart';
import 'package:citizen/feature/app/slash_screen/Splash_screen.dart';
import 'package:firebase_core/firebase_core.dart';
import 'firebase_options.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
      options: FirebaseOptions(
          apiKey: "AIzaSyACXCvQpMex5zbGtHClANTvNeUF50OHKuw",
          appId: "1:66137508951:web:5b524a466b1944f47a2712",
          messagingSenderId: "66137508951",
          projectId: "citizen-project-c3f92",
          storageBucket: "citizen-project-c3f92.appspot.com",));
  runApp( MyApp());
}
class MyApp extends StatelessWidget {
     MyApp({super.key});
  final Idcontroller = TextEditingController();
  final Phonenumebercontroller = TextEditingController();
  final Passwordcontroller = TextEditingController();
  final Emailcontroller = TextEditingController();
  final Datebirthcontroller = TextEditingController();
  final Rolecontroller = TextEditingController();
  final IdenityIDcontroller = TextEditingController();
  final Firstnamecontroller = TextEditingController();
  final Lastnamecontroller = TextEditingController();
  final CollectionReference account = FirebaseFirestore.instance.collection('account');

  @override
  Widget build(BuildContext context) {

    return MaterialApp(debugShowCheckedModeBanner: false,
        home: splash(),
        routes: {
          '/newspage': (context) => NewsPage(),
          '/profilepage': (context) => ProfilePage(),
          '/homepage': (context) => HomePage(),
          '/loginpage' : (context) => LoginPage(),
          '/faqpage':(context) => FaqPage(),
          '/contactpage':(context) => ContactPage(),
          '/FAQpage':(context) => FaqPage()

        }

    );
  }
}
