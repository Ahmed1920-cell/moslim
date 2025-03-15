import 'package:flutter/material.dart';

class RowContainer extends StatelessWidget {
   RowContainer({super.key,required this.text,required this.time,this.activeColor=false});
String text;
String time;
bool activeColor;
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(10),
      margin: EdgeInsets.all(5),
      decoration: BoxDecoration(
          color: activeColor?Color(0xFFD9C3B6):Colors.white,
        borderRadius: BorderRadius.circular(25)
      ),
      child: Row(
        children: [
          Text(text),
          Spacer(),
          Text(time)
        ],
      ),
    );
  }
}
