import 'package:citizen/feature/USER/Function/Drawer.dart';
import 'package:citizen/feature/USER/Function/TextBox.dart';
import 'package:flutter/material.dart';
import 'package:google_nav_bar/google_nav_bar.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:citizen/feature/USER/presentation/page/LOGINPAGE.dart';

final CollectionReference account = FirebaseFirestore.instance.collection('account');
String Email ="";
String Username ="";
String Datebirth ="";
String Idenityid ="";
String Phonenum ="";

class Firebaseinfo extends StatefulWidget {
  const Firebaseinfo({super.key});

  @override
  State<Firebaseinfo> createState() => _FirebaseinfoState();
}

class _FirebaseinfoState extends State<Firebaseinfo> {
  @override
  Widget build(BuildContext context) {
    return const Placeholder();
  }
}

class ProfilePage extends StatefulWidget {
  const ProfilePage({super.key});

  @override
  State<ProfilePage> createState() => _ProfilePageState();
}

class _ProfilePageState extends State<ProfilePage> {
  Future<void> Firebaseinfor() async {
    try {

      QuerySnapshot querySnapshot = await FirebaseFirestore.instance.collection('account')
          .where('id', isEqualTo: Idcontroller.text).where('password', isEqualTo: Passwordcontroller.text).get();
      querySnapshot.docs.forEach((doc) {
        print('ID: ${doc.id},');
        print('Field Value: ${doc['firstname']}');
        print('Field Value: ${doc['datebirth']}');
        print('Field Value: ${doc['idenityid']}');
        if (querySnapshot.docs.isNotEmpty) {
          QueryDocumentSnapshot documentSnapshot = querySnapshot.docs.first;
          Map<String, dynamic> data = documentSnapshot.data() as Map<String, dynamic>;
          setState(() {
            Email = data['email'];
            Username = data['firstname'];
            Datebirth = data['datebirth'];
            Idenityid = data['idenityid'];
            Phonenum = data['phonenumber'];
            // print(Username);
          });
        }
      });
    } catch (e) {
      print('Error fetching data: $e');
    }
  }
  void initState() {
    super.initState();
    Firebaseinfor();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Container(
        child: Column(
          children: [
            const SizedBox(height: 50),
            const Icon(
              Icons.person,
              size: 120,
            ),
            const SizedBox(height: 20),
            Text(Username,
                textAlign: TextAlign.center,
                style:TextStyle(color: Colors.black,fontSize: 20,fontWeight: FontWeight.bold)),
            const SizedBox(height: 50),
            Padding(padding: const EdgeInsets.only(left: 25.0),
              child: Align(
                alignment: Alignment.centerLeft,
                child:Text('Mydetail', style: TextStyle(color:Colors.black,fontWeight: FontWeight.bold),),
              ),
            ),
            MyTextBox(text: Email, sectionName: 'e-mail',),

            MyTextBox(text: Datebirth, sectionName: 'datebirthday',),

            MyTextBox(text: Idenityid, sectionName: 'idenityID',),

            MyTextBox(text: Phonenum, sectionName: 'phonenumber',),
          ],
        ),
      ),
    );
  }
}
