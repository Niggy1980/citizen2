import 'package:citizen/feature/USER/Function/Drawer.dart';
import 'package:citizen/feature/USER/Function/NavBarBottom.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:google_nav_bar/google_nav_bar.dart';
import 'package:image_picker/image_picker.dart';


class HomePage extends StatefulWidget {

  const HomePage({super.key,

  });

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {

  final  _TitleController = TextEditingController();
  final  _NameController = TextEditingController();
  final  _AddressController = TextEditingController();
  final  _CommentController = TextEditingController();
  final  complaint = FirebaseFirestore.instance.collection('complaint');

  //add
  Future<void> _createOrUpdate([DocumentSnapshot? documentSnapshot])async{
    String action = 'create';
    if(documentSnapshot != null){
      action = 'update';
      _TitleController.text = documentSnapshot['title'];
      _NameController.text = documentSnapshot['name'];
      _AddressController.text = documentSnapshot['address'];
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
                  controller: _TitleController,
                  decoration: const InputDecoration(labelText: 'ชื่อเรื่องร้องเรียน'),
                ),
                TextField(
                  controller: _NameController,
                  decoration: const InputDecoration(labelText: 'ชื่อผู้ร้องเรียน'),
                ),
                TextField(
                  controller: _AddressController,
                  decoration: const InputDecoration(labelText: 'รายละเอียดสถานที่'),
                ),
                SizedBox(height: 10,),
                //image
                IconButton(onPressed: () async {


                  ImagePicker imagePicker=ImagePicker();
                  XFile? file = await imagePicker.pickImage(source: ImageSource.gallery);
                  print("${file?.path}");


                } , icon: const Icon(Icons.camera_alt)),

                const SizedBox(height: 25,
                ),
                ElevatedButton (
                    child: Text(action == 'create' ? 'Create' : 'Update'),
                    onPressed: () async {
                final String? title = _TitleController.text;
                final String? name = _NameController.text;
                final String? address = _AddressController.text;
                final String? comment = _CommentController.text;
                if (title !=null && name !=null && address !=null ){
                  if (action == 'create'){
                    await complaint.add({"title":title,"name":name,"address":address,"comment":comment});
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
    await complaint.doc(productId).delete();

    ScaffoldMessenger.of(context).showSnackBar(const SnackBar(content: Text('ลบเรียบร้อยเเล้ว')));
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
      bottomNavigationBar: GNav(
        backgroundColor: Color.fromRGBO(68, 117, 182, 1.0),
        color: Colors.white,
        activeColor: Colors.white,
        tabBackgroundColor: Color.fromRGBO(219, 226, 239, 100),
        padding: EdgeInsets.all(16),
        tabs:  [
          GButton(icon: Icons.home, text: 'Home',onPressed:(){ Navigator.pushNamed(context,'/homepage');},),
          GButton(icon: Icons.newspaper, text: 'News',onPressed:(){ Navigator.pushNamed(context,'/newspage');},),
          GButton(icon: Icons.notifications_active, text: 'Notification',onPressed:(){ Navigator.pushNamed(context,'/notipage');},),
        ],
      ),
      body: StreamBuilder(
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
                        Text(documentSnapshot['title'],
                          style: TextStyle(fontSize: 20, fontWeight: FontWeight
                              .bold),),
                        Text(documentSnapshot['name']),
                        Text(documentSnapshot['address']),


                        SizedBox(height: 10,),
                        Container( child: Row( mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            IconButton(icon:const Icon(Icons.comment),
                              onPressed: ()=> _comment(documentSnapshot),),
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
                          margin: const EdgeInsets.only(bottom: 10),
                          padding: EdgeInsets.only(left: 50,right: 50,top: 20),
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
