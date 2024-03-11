import 'package:flutter/material.dart';

class MyTextBox extends StatelessWidget {
  final String text;
  final String sectionName;

  const MyTextBox({super.key,
    required this.text, required this.sectionName,
  });
  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(color: Colors.grey[300],
        borderRadius: BorderRadius.circular(8),
      ),
      padding: EdgeInsets.only(left: 15,bottom: 15,top: 6),
      margin: EdgeInsets.only(left: 20,right: 20,top: 20),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [

          //section name
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(sectionName,
                style: TextStyle(color: Colors.grey[500]),
              ),
            ],
          ),
          //text
          Text(text),


        ],
      ),
    );
  }
}
