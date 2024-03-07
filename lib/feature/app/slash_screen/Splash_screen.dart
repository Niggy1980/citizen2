import 'package:flutter/material.dart';
import 'package:citizen/feature/USER/presentation/page/LOGINPAGE.dart';

class splash extends StatefulWidget {
  const splash({super.key});

  @override
  State<splash> createState() => _MyWidgetState();
}
class _MyWidgetState extends State<splash> {
  @override
  void initState() {
    super.initState();
    _navigatetologin();
  }
  _navigatetologin() async {
    await Future.delayed(Duration(seconds: 3), () {});
    if (mounted) {
      Navigator.pushAndRemoveUntil(context, MaterialPageRoute(builder: (context) => LoginPage()),
               (Route<dynamic> route) => false,
      );
    }
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color.fromRGBO(33, 158, 188, 0.1),
      body: Center(
        child: Image(image: AssetImage('assets/image/LOGOCC.png'),)
      ),
    );
  }
}