import 'package:flutter/material.dart';
import 'package:google_nav_bar/google_nav_bar.dart';
import 'package:citizen/feature/USER/Function/Drawer.dart';



class FaqPage extends StatefulWidget {
  const FaqPage({super.key});

  @override
  State<FaqPage> createState() => _FaqPageState();
}

class _FaqPageState extends State<FaqPage> {


  bool f1 =false;
  bool f2 =false;

  ExpansionPanelList getpanelList(){
    return(ExpansionPanelList(
      expansionCallback: (panelIndex, isExpanded) {
        setState(() {
          if(panelIndex ==0){
            f1 = !isExpanded;
          }
          if(panelIndex ==1){
            f2= !isExpanded;
          }
        });
      },
      children: [
        ExpansionPanel(
            isExpanded:f1 ,headerBuilder: (context, isExpanded) {
          return(ListTile
            (title: Text("item1"),));
        }, body: ListTile
          (title: Text("item2"),
          subtitle: Text("ex item"),
        )),
        ExpansionPanel(
            isExpanded: f2,headerBuilder: (context, isExpanded) {
          return(ListTile
            (title: Text("item2"),));
        }, body: ListTile
          (title: Text("item3"),
          subtitle: Text("ex item"),
        ))
      ],

    ));
  }
  @override
  Widget build(BuildContext context) {
    return (MaterialApp(
      debugShowCheckedModeBanner: false,
        home:Scaffold(
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
          GButton(icon: Icons.home, text: 'Home',onPressed:(){ Navigator.pushNamed(context,'/homepage');},) ,
          GButton (icon: Icons.newspaper, text: 'News',onPressed:(){ Navigator.pushNamed(context,'/newspage');},),
          GButton(icon: Icons.notifications_active, text: 'Notification',onPressed:(){ Navigator.pushNamed(context,'/notipage');},),
        ],
      ),
      body: Column(
        children: [
        getpanelList()
      ],),
    ),
    ));
  }
}
