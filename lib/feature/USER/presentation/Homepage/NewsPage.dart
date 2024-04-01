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
import 'package:citizen/feature/USER/presentation/Homepage/HomePage.dart';


class NewsPage extends StatefulWidget {
  const NewsPage({super.key});


  @override
  State<NewsPage> createState() => _NewsPageState();
}

int MyIndex = 0;
List pages = [HomePage(),NewsPage(),ProfilePage()];

class _NewsPageState extends State<NewsPage> {
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

  final  pathimage = TextEditingController();
  final  detailnews = TextEditingController();
  final  complaint = FirebaseFirestore.instance.collection('image');
  String Username ="";
  String Role ="";
  Future<void> Firebaseinfor() async {
    try {

      QuerySnapshot querySnapshot = await FirebaseFirestore.instance.collection('account').get();
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
  @override
  Widget build(BuildContext context) {

    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(title: Center(child:Image(image: AssetImage ('assets/image/citizenicon.png'),width: 50,)),
        backgroundColor: Color.fromRGBO(68, 117, 182, 1.0),
      ),
      drawer: MyDrawer(),
      body: ListView(
        children: [
          Container(
            child: Text('News',style: TextStyle(fontSize: 20,fontWeight: FontWeight.bold),),
          ),
          SizedBox(height: 20,
          ),
          Container(
            padding: EdgeInsets.only(left: 50,right: 50,),
            alignment: Alignment.bottomLeft,
            width: 250,
            height: 225,
            child: Image.network('https://cdn.discordapp.com/attachments/992426273714479114/1218202589389127802/image2FLiang290267_Cover3.png?ex=6606ce92&is=65f45992&hm=04be5ccd450ba0f23d17ffc697423732b8ca055cf7aaa616fb8db03dd2c527fa&'),
          ),
          SizedBox(height: 10,),
          Container(
            padding: EdgeInsets.only(left: 50,right: 50,),
            child: Text('- มีน้ำท่วมขังในซอยสรรพาวุธ 1 แยก 2 ระดับความสูงประมาณ 20 ซม. ยาวประมาณ 100 ม.  - มีน้ำท่วมขังในซอยลาซาล 24  ระดับความสูงประมาณ 40 ซม. ยาวประมาณ 800 ม.  - มีน้ำท่วมขังในซอยลาซาล 32  ระดับความสูงประมาณ 40 ซม. ยาวประมาณ 800 ม.  - มีน้ำท่วมขังในซอยลาซาล 46  ระดับความสูงประมาณ 40 ซม. ยาวประมาณ 800 ม.  - มีน้ำท่วมขังในซอยบางนา-ตราด 23 (ข้างเซ็นทรัลบางนา) ระดับความสูงประมาณ 40 ซม. ยาวประมาณ 100 ม.  - มีน้ำท่วมขังในซอยอุดมสุข 56 ระดับความสูงประมาณ 20 ซม. ยาวประมาณ 100 ม.  - มีน้ำท่วมขังถนนเทพรัตน ฝั่งขาออก (สี่แยกบางนา) ระดับความสูงประมาณ 30 ซม. ยาวประมาณ 200 ม.  - มีน้ำท่วมขังในซอยจ่าโสดแยก 24 ระดับความสูงประมาณ 20 ซม. ยาวประมาณ 50 ม.  - มีน้ำท่วมขังถนนสุขุมวิท ฝั่งขาออก (สี่แยกบางนา) ระดับความสูงประมาณ 50 ซม. ยาวประมาณ 200 ม.  - มีน้ำท่วมขังถนนอุดมสุข (แยกอุดมสุข) ระดับความสูงประมาณ 50 ซม. ยาวประมาณ 200 ม.   - มีน้ำท่วมขังซอยลาซาล 22 ระดับความสูงประมาณ 40 ซม. ยาวประมาณ 200 ม.  - มีน้ำท่วมขังถนนสรรพาวุธ (สี่แยกบางนา) ระดับความสูงประมาณ 30 ซม. ยาวประมาณ 100 ม.  - รถเล็ก โปรดหลีกเลี่ยงเส้นทาง!! สี่แยกบางนา , ซอยสรรพาวุธ 1 แยก , ซอยลาซาล 24, ซอยลาซาล 32  - มีน้ำท่วมขังในซอยลาซาล 46  ระดับความสูงประมาณ 40 ซม. ยาวประมาณ 800 ม.  - มีน้ำท่วมขังในซอยบางนา-ตราด 23 (ข้างเซ็นทรัลบางนา) ระดับความสูงประมาณ 40 ซม. ยาวประมาณ 100 ม.  - มีน้ำท่วมขังในซอยอุดมสุข 56 ระดับความสูงประมาณ 20 ซม. ยาวประมาณ 100 ม.  - มีน้ำท่วมขังถนนเทพรัตน ฝั่งขาออก (สี่แยกบางนา) ระดับความสูงประมาณ 30 ซม. ยาวประมาณ 200 ม.  - มีน้ำท่วมขังในซอยจ่าโสดแยก 24 ระดับความสูงประมาณ 20 ซม. ยาวประมาณ 50 ม.  - มีน้ำท่วมขังถนนสุขุมวิท ฝั่งขาออก (สี่แยกบางนา) ระดับความสูงประมาณ 50 ซม. ยาวประมาณ 200 ม.  - มีน้ำท่วมขังถนนอุดมสุข (แยกอุดมสุข) ระดับความสูงประมาณ 50 ซม. ยาวประมาณ 200 ม.  - มีน้ำท่วมขังซอยลาซาล 22 ระดับความสูงประมาณ 40 ซม. ยาวประมาณ 200 ม.  - มีน้ำท่วมขังถนนสรรพาวุธ (สี่แยกบางนา) ระดับความสูงประมาณ 30 ซม. ยาวประมาณ 100 ม.'),
          ),
          SizedBox(height: 30,),
          Container(
            padding: EdgeInsets.only(left: 50,right: 50,),
            alignment: Alignment.bottomLeft,
            width: 250,
            height: 225,
            child: Image.network('https://cdn.discordapp.com/attachments/859994239748145153/1218209172965953647/image2Fkao1.png?ex=6606d4b4&is=65f45fb4&hm=901b871210213e3cb57f1d02bb03d0668a9a2bc0340693d3d6b0cecddca99816&'),
          ),
          SizedBox(height: 10,),
          Container(
            padding: EdgeInsets.only(left: 50,right: 50,),
            child: Text('นับ 1 รับโอนจราจรเมืองกรุง เริ่มจากมีการประชุมแมตช์แรก เพื่อส่งสัญญาณว่า กทม. พร้อมรับถ่ายโอนภารกิจด้านวิศวกรรมจราจรและการบังคับใช้กฎหมายจราจรแล้ว โดยเมื่อวันที่ 9 กุมภาพันธ์ 2567 ที่ผ่านมา มีการประชุมครั้งที่ 1/2567 ของ “คณะกรรมการศึกษาเพื่อกำหนดแนวทางการรับถ่ายโอนภารกิจการกำหนดมาตรฐาน ด้านวิศวกรรมจราจรและการบังคับใช้กฎหมายจราจรในส่วนของกรุงเทพมหานคร'),
          ),
          SizedBox(height: 30,),

          Container(
            padding: EdgeInsets.only(left: 50,right: 50,),
            alignment: Alignment.bottomLeft,
            width: 250,
            height: 225,
            child: Image.network('https://cdn.discordapp.com/attachments/859994239748145153/1218209652454592544/image2Fkao2.png?ex=6606d526&is=65f46026&hm=204f5352281246040c4b8efa500da8147c627252af3ec237852b51e2ba45393d&'),
          ),
          SizedBox(height: 10,),
          Container(
            padding: EdgeInsets.only(left: 50,right: 50,),
            child: Text('"ค่าฝุ่น PM 2.5 กรุงเทพฯวันนี้ (20 ธ.ค.66) เวลา 05.00 - 07.00 น. ศูนย์ข้อมูลคุณภาพอากาศกรุงเทพมหานคร รายงาน สถานการณ์ฝุ่นละออง ขนาดไม่เกิน 2.5 ไมครอน (PM2.5) พื้นที่กรุงเทพมหานคร ตรวจวัดได้ 18.5-47.4 ไมโครกรัม/ลูกบาศก์เมตร พบว่า เกินค่ามาตรฐาน อยู่ในระดับสีส้ม เริ่มมีผลกระทบต่อสุขภาพ จำนวน 11 พื้นที่ สถานการณ์ฝุ่น PM 2.5 เมื่อเวลา 07.00 น. วันนี้ (20 ธ.ค.66) ตรวจวัดค่าฝุ่นละออง PM 2.5 ได้ในช่วง 18.5-46.8 ไมโครกรัม/ลูกบาศก์เมตร (มคก./ลบ.ม.) โดยมีแนวโน้มเพิ่มขึ้นเมื่อเทียบกับเมื่อวานในช่วงเวลาเดียวกัน"'),
          ),
          SizedBox(height: 30,),

          Container(
            padding: EdgeInsets.only(left: 50,right: 50,),
            alignment: Alignment.bottomLeft,
            width: 250,
            height: 225,
            child: Image.network('https://cdn.discordapp.com/attachments/859994239748145153/1218209704245985280/image2Fkao3.png?ex=6606d532&is=65f46032&hm=2e6bcf37e441ed6be5d76621478f9119f18f4ceea263dfea240d4bf2733afe80&'),
          ),
          SizedBox(height: 10,),
          Container(
            padding: EdgeInsets.only(left: 50,right: 50,),
            child: Text('"กลายเป็นประเด็นร้อนแรงที่สร้างความตื่นตระหนกไปทั่ววงการรับเหมาก่อสร้าง หลังมีข่าวว่าพี่ใหญ่ของวงการอย่าง บริษัท อิตาเลียนไทย หรือ ITD ประสบปัญหาสภาพคล่องอย่างต่อเนื่อง ซึ่งส่วนใหญ่เป็นผลจากโครงการที่ไปลงทุนในต่างประเทศ จนทำให้หมุนเงินไม่ทันจ่ายผู้รับเหมารายย่อยที่เป็นซับคอนแทรค ส่งผลกระทบไปถึงการค้างค่าแรงพนักงาน และแรงงานก่อสร้าง จนต้องออกมาประท้วงในสัปดาห์นี้ ล่าสุดบริษัท อิตาเลียนไทย ดีเวล๊อปเมนต์ จำกัด (มหาชน) หรือ ITD ได้ทำหนังสือชี้แจงชี้แจงต่อตลาดหลักทรัพย์แห่งประเทศไทย(ตลท.) โดยมีรายละเอียดดังนี้ 1. ข้อเท็จจริงจากข่าวที่ปรากฏในสื่อข้างต้น ข้อมูลเรื่องการจ่ายเงินเดือนพนักงานที่ไม่ครบถ้วน ซึ่งปรากฏตามสื่อนั้นเป็นเรื่องจริง เนื่องจากปัจจุบันบริษัทฯ ยังขาดสภาพคล่องทางการเงิน 2. แนวทางการดำเนินการแก้ไขปัญหาดังกล่าว เนื่องจากรายรับจากโครงการยังน้อยกว่าค่าใช้จ่ายบริษัทฯ บริษัทฯ จึงต้องขอกู้ยืมเงินจากธนาคารเพิ่มเติมเพื่อนำเงินมาบริหารกิจการ ซึ่งขณะนี้อยู่ระหว่างดำเนินการขอสินเชื่อ และเจรจากับธนาคารที่เกี่ยวข้อง"'),
          ),
          SizedBox(height: 30,),

          Container(
            padding: EdgeInsets.only(left: 50,right: 50,),
            alignment: Alignment.bottomLeft,
            width: 250,
            height: 225,
            child: Image.network('https://cdn.discordapp.com/attachments/859994239748145153/1218209739117428917/image2Fkao4.png?ex=6606d53b&is=65f4603b&hm=69be7a37b7ba64fc5735adb12e5f56bed40099a324102b8144f640902a30f2ae&'),
          ),
          SizedBox(height: 10,),
          Container(
            padding: EdgeInsets.only(left: 50,right: 50,),
            child: Text('""สุริยะ" ขีดเส้นปี 68 ปิดตำนานถนนพระราม 2 ล่าช้าขู่ตัดเกรด อ่านให้ฟัง 00:03 อ่านข่าวให้ฟังโดย Botnoi Voice เว็บแอปพลิเคชันสำหรับสร้างเสียงจากข้อความด้วย AI (Text to Speech) "สุริยะ" ขีดเส้นปี 2568 ต้องปิดตำนานถนนพระราม 2 ห้ามล่าช้า ขู่ตัดเกรดผู้รับเหมา กำชับตรวจคืบหน้าทุก 2 เดือน ปัญหาการก่อสร้างถนนพระราม 2 ที่ล่าช้า จนประชาชนวิพากษ์วิจารณ์ว่าเป็นโครงการเจ็ดชั่วโคตร รัฐมนตรี​ว่าการ​กระทรวงคมนาคม เรียกผู้รับเหมาก่อสร้างโครงการบนถนนพระรามสองเข้าหารือ พร้อมเน้นย้ำติดตามทุกสัญญาห้ามล่าช้าต่ำกว่าร้อยละ 50 ของแผนรายเดือน หากมีปัญหาขู่ว่าจะยกเลิกสัญญา ภายหลังการหารือกับผู้รับเหมาก่อสร้างถนนพระราม 2 นายสุริยะ จึงรุ่งเรืองกิจ รัฐมนตรีว่าการกระทรวงคมนาคม กล่าวว่า ได้รับการรายงานมาตลอดว่าถนนพระรามสองมีการจราจรติดขัด ได้สั่งการให้อธิบดีกรมทางหลวงหารือผู้รับเหมาให้เสร็จทันตามกำหนด ซึ่งที่ผ่านมายังไม่คืบหน้าเท่าที่ควร เพราะขาดมาตรการบังคับผู้รับเหมาให้ทำตามสัญญา​"'),
          ),
          SizedBox(height: 10,),
        ],
      ),
    );
  }
}
