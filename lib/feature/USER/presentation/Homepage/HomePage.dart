
import 'dart:io';
import 'dart:typed_data';
import 'dart:html' as html;
import 'package:flutter/services.dart';
import 'package:firebase_storage/firebase_storage.dart' as firebase_storage;
import 'package:citizen/feature/USER/Function/Drawer.dart';
import 'package:citizen/feature/USER/Function/NavBarBottom.dart';
import 'package:citizen/feature/USER/presentation/Homepage/NewsPage.dart';
import 'package:citizen/feature/USER/presentation/Homepage/ProfilePage.dart';
import 'package:citizen/feature/USER/presentation/page/Newpage.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:file_picker/file_picker.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/material.dart';
import 'package:google_nav_bar/google_nav_bar.dart';
import 'package:image_picker/image_picker.dart';
import 'package:citizen/feature/USER/presentation/page/LOGINPAGE.dart';


class HomePage extends StatefulWidget {
  const HomePage({super.key,});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  Uint8List? imageBytes;
  late File imageFile;

  Future<void> pickImage() async {
    try {
      final result = await FilePicker.platform.pickFiles(type: FileType.image);
      if (result == null || result.files.isEmpty) {
        return;
      }
      final fileBytes = result.files.first.bytes;
      if (fileBytes == null) {
        return;
      }
      setState(() {
        imageBytes = Uint8List.fromList(fileBytes);
        imageFile = File.fromRawPath(imageBytes!);
      });
    } catch (e) {
      print('Failed to pick image: $e');
    }
  }
  Future<String?> uploadImage(File imageFile) async {
    try {
      final dateTime = DateTime.now();
      final blob = html.Blob([imageFile.readAsBytesSync()]);
      final url = '${dateTime.year}${dateTime.month}${dateTime.day}/${dateTime.microsecondsSinceEpoch}.jpg';
      final storageRef = firebase_storage.FirebaseStorage.instance.ref().child('profile/$url');
      final uploadTask = storageRef.putBlob(blob);
      await uploadTask.whenComplete(() => null);
      final imageUrl = await storageRef.getDownloadURL();
      return imageUrl;
    } catch (e) {
      print('Error uploading image: $e');
      return null;
    }
  }

  final  _TitleController = TextEditingController();
  final  _NameController = TextEditingController();
  final  _AddressController = TextEditingController();
  final  _CommentController = TextEditingController();
  final _ImageUrlController = TextEditingController();
  final  complaint = FirebaseFirestore.instance.collection('complaint');
  String Username ="";
  String Role ="";
  Future<void> Firebaseinfor() async {
    try {

      QuerySnapshot querySnapshot = await FirebaseFirestore.instance.collection('account')
          .where('id', isEqualTo: Idcontroller.text).where('password', isEqualTo: Passwordcontroller.text).get();
      querySnapshot.docs.forEach((doc) {
        if (querySnapshot.docs.isNotEmpty) {
          QueryDocumentSnapshot documentSnapshot = querySnapshot.docs.first;
          Map<String, dynamic> data = documentSnapshot.data() as Map<String, dynamic>;
          setState(() {
            Username = data['firstname'];
            Role = data['role'];

            print(Username);
            print(Role);
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

String ImageUrl = " ";

  Future<void> _createOrUpdate([DocumentSnapshot? documentSnapshot])async{
    String action = 'create';
    if(documentSnapshot != null){
      action = 'update';
      _TitleController.text = documentSnapshot['title'];
      Username = documentSnapshot['name'];
      _AddressController.text = documentSnapshot['address'];
      _CommentController.text = documentSnapshot['comment'];
      _ImageUrlController.text = documentSnapshot['image'];

    }
    await showModalBottomSheet(
        isScrollControlled: true,
        context: context, builder: (BuildContext ctx){
          return Padding(padding: EdgeInsets.only(top: 20,left: 20,right: 20,
              bottom: MediaQuery.of(ctx).viewInsets.bottom+20),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                TextField(
                  controller: _TitleController,
                  decoration: const InputDecoration(labelText: 'ชื่อเรื่องร้องเรียน'),
                ),
                TextField(
                  controller: _AddressController,
                  decoration: const InputDecoration(labelText: 'รายละเอียดสถานที่'),
                ),
                SizedBox(height: 10,),
                //image
              IconButton(onPressed: () {
                pickImage();
              }, icon: Icon(Icons.camera_alt)),

                const SizedBox(height: 25,
                ),
                ElevatedButton (
                    child: Text(action == 'create' ? 'Create' : 'Update'),
                    onPressed: () async {
                final String? title = _TitleController.text;
                final String? name = Username;
                final String? address = _AddressController.text;
                final String? comment = _CommentController.text;
                final ImageUrl = _ImageUrlController.text;
                if (title !=null && name !=null && address !=null ){
                  if (action == 'create'){
                    await complaint.add({"title":title,"name":name,"address":address,"comment":comment,"image":ImageUrl});
                  }
                  if (action == 'update'){
                    await complaint
                        .doc(documentSnapshot!.id)
                        .update({'title':title,"name":name,"address":address});
                  }
                  _TitleController.text='';
                  _NameController.text='';
                  _AddressController.text='';
                  Navigator.of(context).pop();
                }
                },
                )
              ],
            ),
          );
    });
  }
  //delete
  Future<void> _deleteProduct(String productId) async {
    AlertDialog alert = AlertDialog(
      title: Text(
        'Alert',
        style: TextStyle(
          color: Colors.red,
          fontWeight: FontWeight.bold,
        ),
      ),
      content: Text('Do you want to delete this complaint?'),
      actions: [
        TextButton(
          child: Text('OK'),
          onPressed: () async {
            Navigator.of(context).pop();
            await complaint.doc(productId).delete();
            ScaffoldMessenger.of(context).showSnackBar(const SnackBar(content: Text('ลบเรียบร้อยเเล้ว')));
          },
        ),
        TextButton(
          child: Text('Cancel'),
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
  }

//comment
  Future<void> _comment([DocumentSnapshot? documentSnapshot])async{
    String action = 'create';
    if(documentSnapshot != null){
      action = 'update';
      _CommentController.text = documentSnapshot['comment'];
    }
    await showModalBottomSheet(
        isScrollControlled: true,
        context: context, builder: (BuildContext ctx){
      return Padding(padding: EdgeInsets.only(top: 20,left: 20,right: 20,
          bottom: MediaQuery.of(ctx).viewInsets.bottom+20),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            TextField(
              controller: _CommentController,
              decoration: const InputDecoration(labelText: 'ข้อความตอบกลับ'),
            ),
            SizedBox(height: 10,),
            IconButton(onPressed: () async {

              ImagePicker imagePicker=ImagePicker();
              XFile? file = await imagePicker.pickImage(source: ImageSource.gallery);
              print("${file?.path}");


            } , icon: const Icon(Icons.camera_alt)),
            const SizedBox(height: 25,
            ),
            ElevatedButton (
              child: Text(action == 'create' ? 'Create' : 'Post'),
              onPressed: () async {
                final String? comment = _CommentController.text;

                if (comment !=null ){
                  if (action == 'create'){
                    await complaint.add({"comment":comment,});
                  }
                  if (action == 'update'){
                    await complaint
                        .doc(documentSnapshot!.id)
                        .update({'comment':comment,});
                  }
                  _CommentController.text='';
                  Navigator.of(context).pop();
                }
              },

            )
          ],
        ),
      );
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(title: Center(child:Image(image: AssetImage ('assets/image/citizenicon.png'),width: 50,)),
        backgroundColor: Color.fromRGBO(68, 117, 182, 1.0),
      ),
      drawer: MyDrawer(),
      body:
      StreamBuilder(
          stream: complaint.snapshots(),
          builder: (context, AsyncSnapshot<QuerySnapshot> streamSnapshort) {
            if (streamSnapshort.hasData) {
              return ListView.builder(
                  itemCount: streamSnapshort.data!.docs.length,
                  itemBuilder: (context, index) {
                    final DocumentSnapshot documentSnapshot = streamSnapshort
                        .data!.docs[index];
                    return Container(
                      decoration: BoxDecoration(
                        color: Colors.grey[200],
                        borderRadius: BorderRadius.circular(8),
                      ),
                      margin: EdgeInsets.only(top: 25, left: 25, right: 25),
                      padding: EdgeInsets.all(25),
                      child:
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Row(children: [
                            Container(
                                child: Icon(Icons.person, size: 43,),
                              ),
                              Container(
                                child: Text(documentSnapshot['name'],style: TextStyle(fontWeight: FontWeight.bold),),
                              )
                            ],
                          ),
                          SizedBox(height: 5,),
                          Row(
                            children: [
                              Container(
                                child: Text("หัวข้อ: ",style: TextStyle(color: Colors.blue),),
                              ),
                              Container(child: Text(documentSnapshot['title'], style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),)),
                            ],
                          ),
                          SizedBox(height: 3,),
                          Row(
                            children: [
                              Container(child: Text("สถานที่: ",style: TextStyle(color: Colors.blue,),),
                              ),
                              Container(child: Text(documentSnapshot['address'],style: TextStyle(fontSize: 17,fontWeight: FontWeight.bold,color: Colors.grey[500]),)),
                            ],
                          ),
                          SizedBox(height: 5,),
                          Container(
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: <Widget>[
                                if (imageBytes != null)
                                  Image.memory(
                                    imageBytes!,
                                    height: 300,
                                    width: 400,
                                    fit: BoxFit.cover,
                                  ),
                              ],
                            ),
                          ),

                          SizedBox(height: 10,),
                          Container( child: Row( mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Visibility(child: IconButton(icon:const Icon(Icons.comment),
                                onPressed: ()=> _comment(documentSnapshot),
                              ),visible:(Role == 'Admin'),),
                              IconButton(icon:const Icon(Icons.edit),
                                onPressed: ()=> _createOrUpdate(documentSnapshot),),
                              IconButton(icon:const Icon(Icons.delete),
                                onPressed: ()=> _deleteProduct(documentSnapshot.id),),
                            ],
                          ),

                          ),

                          SizedBox(height: 10,),
                          Container(
                            decoration: BoxDecoration(
                              color: Colors.grey[300],
                            ),
                            margin: const EdgeInsets.only(left: 20,right: 20),
                            padding: EdgeInsets.only(left: 50,right: 50,top: 5),
                            child: Column(
                              children: [
                                Center(child: Text(documentSnapshot['comment'],textAlign: TextAlign.center,))
                              ],
                            ),

                          ),


                        ],
                      ),
                    );

                  }

              );

            }
            return const Center(
              child: CircularProgressIndicator(),
            );
          },
        ),


      //add new
      floatingActionButton: FloatingActionButton(
        backgroundColor: Color.fromRGBO(68, 117, 182, 1.0),
        onPressed: () => _createOrUpdate(),
        child: const Icon(Icons.add_comment,color: Color.fromRGBO(
            255, 255, 255, 1.0),),
      ),
    );
  }
}
