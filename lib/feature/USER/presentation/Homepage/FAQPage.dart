import 'package:flutter/material.dart';
import 'package:google_nav_bar/google_nav_bar.dart';
import 'package:citizen/feature/USER/Function/Drawer.dart';



class FaqPage extends StatefulWidget {
  const FaqPage({super.key});

  @override
  State<FaqPage> createState() => _FaqPageState();
}

class _FaqPageState extends State<FaqPage> {


  bool f1 = false;
  bool f2 = false;
  bool f3 = false;
  bool f4 = false;
  bool f5 = false;

  ExpansionPanelList getpanelList(){
    return(ExpansionPanelList(
      expansionCallback: (panelIndex, isExpanded) {
        setState(() {
          if(panelIndex == 0){
            f1 = isExpanded;
          }
          if(panelIndex == 1){
            f2 = isExpanded;
          }
          if(panelIndex == 2){
            f3 = isExpanded;
          }
          if(panelIndex == 3){
            f4 = isExpanded;
          }
          if(panelIndex == 4){
            f5 = isExpanded;
          }
        });
      },
      children: [
        ExpansionPanel(
            isExpanded:f1 ,headerBuilder: (context, isExpanded) {
          return(ListTile
            (title: Text("สามารถร้องเรียนอะไรได้บ้าง",style: TextStyle(fontSize: 17),),));
        }, body: ListTile
          (title: Text("สามารถแจ้งปัญหาทั่วไปที่เกี่ยวกับภาครัฐได้ทั้งหมด เช่น ถนนชำรุด,ท่อแตก,ฟุตบาทพัง ฯลฯ ",style: TextStyle(color: Colors.grey[600]),),
        )),
        ExpansionPanel(
            isExpanded: f2,headerBuilder: (context, isExpanded) {
          return(ListTile
            (title: Text("แอพนี้มีไว้เพื่ออะไร",style: TextStyle(fontSize: 17)),));
        }, body: ListTile
          (title: Text("เพื่อให้ปชช.ร้องเรียนปัญหาที่เกิดขึ้น เพื่อให้หน่วยงานรัฐเข้าไปช่วยเหลือได้อย่างรวดเร็ว และประโยชน์อีกมากมาย",style: TextStyle(color: Colors.grey[600])),
        )),
        ExpansionPanel(
            isExpanded: f3,headerBuilder: (context, isExpanded) {
          return(ListTile
            (title: Text("จะติดตามผลการร้องเรียนได้อย่างไร",style: TextStyle(fontSize: 17)),));
        }, body: ListTile
          (title: Text(" สามารถติดตามผลการร้องเรียนได้ผ่านตัวเเอพพลิเคชั่นได้เลย ถ้าหากปัญหาถูกเเก้ไขเเล้วจะขึ้นปัญหาถูกเเก้ไขพร้อมกับรูปภาพหลังเเก้ไข",style: TextStyle(color: Colors.grey[600])),
        )),
        ExpansionPanel(
            isExpanded: f4,headerBuilder: (context, isExpanded) {
          return(ListTile
            (title: Text("จะรู้ได้อย่างไรว่าหน่วยงานรับผิดชอบจะดำเนินการแก้ไขปัญหา",style: TextStyle(fontSize: 17)),));
        }, body: ListTile
          (title: Text("จะมีการอัพเดตผลการร้องเรียนภายใน 2-8 สัปดาห์ถ้าไม่ทราบผลภายในระยะเวลาที่กำหนดสามารถสอบถามทางช่องทางติดต่อที่กำหนดไว้ได้เลย",style: TextStyle(color: Colors.grey[600])),
        )),
        ExpansionPanel(
            isExpanded: f5,headerBuilder: (context, isExpanded) {
          return(ListTile
            (title: Text("ระยะเวลาที่ใช้ในการดำเนินการต่างๆของการร้องเรียน",style: TextStyle(fontSize: 17)),));
        }, body: ListTile
          (title: Text("โดยปกติปัญหาที่ถูกร้องเรียนมานั้นขึ้นอยู่กับหลายปัจจัยส่วนใหญ่ปัญหาจะถูกเเก้ไขตั้งเเต่ 2 สัปดาห์ถึง 8 สัปดาห์ หลังการร้องเรียน",style: TextStyle(color: Colors.grey[600])),
        )),
      ],
    ));
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(title: Center(child: Image(
        image: AssetImage('assets/image/citizenicon.png'), width: 50,)),
        backgroundColor: Color.fromRGBO(68, 117, 182, 1.0),
      ),
      drawer: MyDrawer(),
      bottomNavigationBar: GNav(
        backgroundColor: Color.fromRGBO(68, 117, 182, 1.0),
        color: Colors.white,
        activeColor: Colors.white,
        padding: EdgeInsets.all(16),
        tabs:  [
          GButton(icon: Icons.home, text: 'Home',onPressed:(){ Navigator.pushNamed(context,'/homepage');},),
          GButton(icon: Icons.newspaper, text: 'News',onPressed:(){ Navigator.pushNamed(context,'/newspage');},),
          GButton(icon: Icons.account_circle, text: 'Profile',onPressed:(){ Navigator.pushNamed(context,'/profilepage');},),
        ],
      ),
      body: Column(
        children: [
          getpanelList()
        ],),
    );
  }
}
