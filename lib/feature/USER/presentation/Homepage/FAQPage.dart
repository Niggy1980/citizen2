import 'package:flutter/material.dart';
import 'package:google_nav_bar/google_nav_bar.dart';
import 'package:citizen/feature/USER/Function/Drawer.dart';

class Item {
  Item({
    required this.headerText,
    required this.expandedText,
    this.isExpanded = false,
});
  String headerText;
  String expandedText;
  bool isExpanded;
}

class FaqPage extends StatefulWidget {
  const FaqPage({super.key});

  @override
  State<FaqPage> createState() => _FaqPageState();
}

class _FaqPageState extends State<FaqPage> {
  final List<Item> _data = List<Item>.generate(1,
          (int index) {
            return Item(headerText: 'สามารถร้องเรียนอะไรได้บ้าง $index', expandedText: 'This is number $index',);
          });
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        title: Center(child:Image(image: AssetImage ('assets/image/citizenicon.png'),width: 50,)),
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
      body:SingleChildScrollView(
        child: ExpansionPanelList(
          expansionCallback: (int index,bool isExpanded){
            setState(() {
              _data[index].isExpanded = !isExpanded;
            });
          },
          children:_data.map<ExpansionPanel>((Item item) {
            return ExpansionPanel(
              headerBuilder: (BuildContext context, bool isExpanded) {
                return ListTile(
                  title: Text(item.headerText),
                );
              },
              body: ListTile(
                title: Text(item.expandedText),
                subtitle: const Text('to delete this item,click icon'),
                trailing: const Icon(Icons.dangerous,
                  color: Colors.blue,),
                onTap: (){
                  setState(() {
                    _data
                        .removeWhere((Item currentItem) => item == currentItem);
                  });
                },
              ),
              isExpanded: item.isExpanded,
            );
          }).toList(),
        ),
      ),

    );
  }
}

