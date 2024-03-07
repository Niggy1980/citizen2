import 'package:flutter/material.dart';


class MyDrawer extends StatelessWidget {
  const MyDrawer({super.key});

  @override
  Widget build(BuildContext context) {
    return Drawer(
      backgroundColor: Color.fromRGBO(68, 117, 182, 1.0),
      child:  Column(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Column(children: [
          const DrawerHeader(
            decoration: BoxDecoration(
             color: Colors.white,
            ),
            child: Align(
              alignment: Alignment.center,
              child: Image(image: AssetImage('assets/image/LOGOCC.png'), width: 400,),
            ),
          ),
          ListTile(
            leading: Icon(Icons.face,color: Colors.white,),
            title:  Text("P R O F I L E"),textColor: Colors.white,
            onTap: () {
              Navigator.pop(context);

              Navigator.pushNamed(context, '/profilepage');
            },
          ),
          ListTile(
            leading: Icon(Icons.question_mark_sharp,color: Colors.white,),
            title: Text("F Y Q"),textColor: Colors.white,
            onTap: (){
              Navigator.pop(context);
              Navigator.pushNamed(context, '/faqpage');
            },
          ),
          ListTile(
            leading: Icon(Icons.phone,color: Colors.white,),
            title: Text("C O N T A C T"),textColor: Colors.white,
            onTap: (){
              Navigator.pop(context);
              Navigator.pushNamed(context, '/contactpage');
            },

          ),
          SizedBox(height:320),
          Padding(
            padding: const EdgeInsets.only(bottom: 25.0),
            child: ListTile(
              leading: Icon(Icons.logout,color: Colors.white,),
              title: Text("L O G O U T"),textColor: Colors.white,
              onTap: (){
                Navigator.pop(context);

                Navigator.pushNamed(context, '/loginpage');

              },
            ),
          )

        ],
      ),
    ],
    ),

    );

  }
}