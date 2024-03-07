
import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_core/firebase_core.dart';
import 'dart:js';
import 'package:intl/intl.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:citizen/feature/USER/presentation/page/LOGINPAGE.dart';
import 'package:image_picker/image_picker.dart';
import 'package:flutter/services.dart';
import 'dart:io';

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}
final formkey = GlobalKey<FormState>();
final Idcontroller = TextEditingController();
final Confirmpassword = TextEditingController();
final Phonenumebercontroller = TextEditingController();
final Passwordcontroller = TextEditingController();
final Emailcontroller = TextEditingController();
final Datebirthcontroller = TextEditingController();
final Rolecontroller = TextEditingController();
final IdenityIDcontroller = TextEditingController();
final Firstnamecontroller = TextEditingController();
final Lastnamecontroller = TextEditingController();
final CollectionReference account = FirebaseFirestore.instance.collection('account');


Future Create([DocumentSnapshot? documentSnapshot]) async {
  await account.add({
    "id": Idcontroller.text,
    "phonenumber": Phonenumebercontroller.text,
    "password": Passwordcontroller.text,
    "email": Emailcontroller.text,
    "datebirth": Datebirthcontroller.text,
    "idenityid": IdenityIDcontroller.text,
    "firstname": Firstnamecontroller.text,
    "lastname": Lastnamecontroller.text,
    "role": "user"
  });
  // Fluttertoast.showToast(msg: "Succesful",timeInSecForIosWeb: 4,);
}

class _MyAppState extends State<MyApp> {
  // File? image;
  // Future pickImage() async {
  //   try {
  //     final image = await ImagePicker().pickImage(source: ImageSource.gallery);
  //     if(image == null) return;
  //     final imageTemp = File(image.path);
  //     setState(() => this.image = imageTemp);
  //   } on PlatformException catch(e) {
  //     print('Failed to pick image: $e');
  //   }
  // }

  @override
  Widget build(BuildContext context) {
    return const Placeholder();
  }
}

class Register extends StatefulWidget {
  const Register({Key? key}) : super(key: key);
  @override
  State<Register> createState() => _RegisterState();
}
class _RegisterState extends State<Register> {
  File? image;

  Future pickImage() async {
    try {
      final image = await ImagePicker().pickImage(source: ImageSource.gallery);

      if (image == null) return;

      final imageTemp = File(image.path);

      setState(() => this.image = imageTemp);
    } on PlatformException catch (e) {
      print('Failed to pick image: $e');
    }
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        backgroundColor: Color.fromRGBO(33, 158, 188, 0.1),
        body: Center(
          child: (ListView(
            children: [
              SizedBox(
                height: 50,
              ),
              Container(
                child: Center(
                  child: Text("let's create your account",style: TextStyle(fontWeight: FontWeight.bold,fontSize: 25),),
                ),
              ),
              SizedBox(
                height: 30,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Container(
                    child: Icon(Icons.account_circle, color: Colors.blue,size: 40,),
                  ),
                  SizedBox(
                    width: 10,
                  ),
                  Container(
                    // decoration: BoxDecoration(border: Border.all(color: Colors.green)),
                      child: Align(
                        alignment: Alignment.center,
                        child: Form(
                          key: formkey,
                          child: SizedBox(
                            width: 350,
                            height: 50,
                            child: TextFormField(
                              controller: Idcontroller,
                              decoration: InputDecoration(border: OutlineInputBorder(),labelText: " ID"),
                              validator: (id){
                                if(id!.isEmpty || !RegExp(r'^[a-z A-Z+$]').hasMatch(id)){
                                  return "Enter correct name";
                                }else{
                                  return null;
                                }
                              },),
                          ),
                        ),
                      )
                  ),
                ],
              ),
              SizedBox(
                height: 10,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Container(
                    child: Icon(Icons.lock, color: Colors.blue, size: 40,),
                  ),
                  SizedBox(
                    width: 10,
                  ),
                  Container(
                    // decoration: BoxDecoration(border: Border.all(color: Colors.green)),
                      child: Align(
                        alignment: Alignment.center,
                        child: SizedBox(
                          width: 350,
                          height: 50,
                          child: TextFormField(
                              obscureText: true,
                              controller: Passwordcontroller,
                              decoration: InputDecoration(border: OutlineInputBorder(), labelText: "Password")),
                        ),
                      )),
                ],
              ),
              SizedBox(
                height: 10,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Container(
                    child:  Icon(Icons.lock, color: Colors.blue, size: 40,),
                  ),
                  SizedBox(
                    width: 10,
                  ),
                  Container(
                    // decoration: BoxDecoration(border: Border.all(color: Colors.green)),
                      child: Align(
                        alignment: Alignment.center,
                        child: SizedBox(
                          width: 350,
                          height: 50,
                          child: TextFormField(
                              obscureText: true,
                              controller: Confirmpassword,
                              decoration: InputDecoration(border: OutlineInputBorder(),labelText: " Confirm password")),
                        ),
                      )),
                ],
              ),
              SizedBox(
                height: 10,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Container(
                      child:  Icon(Icons.person, color: Colors.blue, size: 40,)
                  ),
                  SizedBox(
                    width: 10,
                  ),
                  Container(
                    // decoration: BoxDecoration(border: Border.all(color: Colors.green)),
                      child: Align(
                        alignment: Alignment.center,
                        child: SizedBox(width: 350, height: 50,
                          child: TextFormField(
                              controller: Firstnamecontroller,
                              decoration: InputDecoration(border: OutlineInputBorder(), labelText: " Firstname")),
                        ),
                      )),
                ],
              ),
              SizedBox(
                height: 10,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Container(
                    child: Icon(Icons.person, color: Colors.blue, size: 40,),
                  ),
                  SizedBox(
                    width: 10,
                  ),
                  Container(
                    // decoration: BoxDecoration(border: Border.all(color: Colors.green)),
                      child: Align(
                        alignment: Alignment.center,
                        child: SizedBox(
                          width: 350,
                          height: 50,
                          child: TextFormField(
                              controller: Lastnamecontroller,
                              decoration: InputDecoration(border: OutlineInputBorder(),labelText: " Lastname")),
                        ),
                      )),
                ],
              ),
              SizedBox(
                height: 10,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Container(
                    child: Icon(Icons.credit_card_outlined, color: Colors.blue, size: 40,),
                  ),
                  SizedBox(
                    width: 10,
                  ),
                  Container(
                    // decoration: BoxDecoration(border: Border.all(color: Colors.green)),
                      child: Align(
                        alignment: Alignment.center,
                        child: SizedBox(
                          width: 350,
                          height: 50,
                          child: TextFormField(
                              controller: IdenityIDcontroller,
                              decoration: InputDecoration(border: OutlineInputBorder(), labelText: " Idenity ID")),
                        ),
                      )),
                ],
              ),
              SizedBox(
                height: 10,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Container(
                    child:  Icon(Icons.date_range, color: Colors.blue, size: 40,),
                  ),
                  SizedBox(
                    width: 10,
                  ),
                  Container(
                    // decoration: BoxDecoration(border: Border.all(color: Colors.green)),
                      child: Align(
                        alignment: Alignment.center,
                        child: SizedBox(
                          width: 350,
                          height: 50,
                          child: TextFormField(
                              controller: Datebirthcontroller,
                              decoration: InputDecoration(border: OutlineInputBorder(), labelText: " Date of birth (DD/MM/YYYY)",
                              )),
                        ),
                      )),
                ],
              ),
              SizedBox(
                height: 10,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Container(
                    child: Icon(Icons.mail_outline, color: Colors.blue, size: 40,),
                  ),
                  SizedBox(
                    width: 10,
                  ),
                  Container(
                    // decoration: BoxDecoration(border: Border.all(color: Colors.green)),
                      child: Align(
                        alignment: Alignment.center,
                        child: SizedBox(
                          width: 350,
                          height: 50,
                          child: TextFormField(
                              controller: Emailcontroller,
                              decoration: InputDecoration(border: OutlineInputBorder(),labelText: " E-mail")),
                        ),
                      )),
                ],
              ),
              SizedBox(
                height: 10,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Container(
                      child: Icon(Icons.phone, color: Colors.blue, size: 40,)
                  ),
                  SizedBox(
                    width: 10,
                  ),
                  Container(
                    // decoration: BoxDecoration(border: Border.all(color: Colors.green)),
                      child: Align(
                        alignment: Alignment.center,
                        child: SizedBox(
                          width: 350,
                          height: 50,
                          child: TextFormField(
                              controller: Phonenumebercontroller,
                              decoration: InputDecoration(border: OutlineInputBorder(), labelText: " Phonoenumber")),
                        ),
                      )),
                ],
              ),
              SizedBox(
                height: 10,
              ),
              Container(
                  child: Align(
                    alignment: Alignment.center,
                    child: SizedBox(
                      width: 200,
                      height: 200,
                      child: IconButton(
                        icon: Icon(Icons.upload,size: 100,),
                        onPressed: (){
                      pickImage();
                        },
                      ),
                    ),
                  )
              ),
              SizedBox(
                height: 10,
              ),
              Container(
                  child: Align(
                    alignment: Alignment.center,
                    child: ElevatedButton(
                      child: Text(
                        "Register",
                        style: TextStyle(color: Colors.white),
                      ),

                      onPressed: () {
                        if (Confirmpassword.text != Passwordcontroller.text) {
                          AlertDialog alert = AlertDialog(
                            title: Text('Alert',
                                style: TextStyle(
                                  color: Colors.red,
                                  fontWeight: FontWeight.bold,
                                )),
                            content: Text("Passwords doesn't match"),
                            actions: [
                              TextButton(
                                child: Text('OK'),
                                onPressed: () {
                                  Navigator.of(context).pop();
                                },
                              ),
                            ],
                          );
                          showDialog(
                            context: context,
                            builder: (BuildContext context) {
                              return alert;
                            },
                          );
                          return;
                        } else {
                          Create();
                          AlertDialog alert = AlertDialog(
                            title: Text('Success', style: TextStyle(color: Colors.green, fontWeight: FontWeight.bold,)),
                            content: Text("Account registered"),
                            actions: [
                              TextButton(
                                child: Text('OK'),
                                onPressed: () {
                                  Navigator.of(context).pop();
                                  Navigator.of(context).push(
                                    MaterialPageRoute(builder: (_) => LoginPage()),
                                  );
                                },
                              ),
                            ],
                          );
                          showDialog(
                            context: context,
                            builder: (BuildContext context) {
                              return alert;
                            },
                          );
                          return;
                        }
                      },
                      style: ElevatedButton.styleFrom(backgroundColor: Colors.blue,padding: EdgeInsets.only(left: 60,right: 60,bottom: 10,top: 10),),
                    ),
                  )),
            ],
          )),
        ),
      ),
    );
  }
}
