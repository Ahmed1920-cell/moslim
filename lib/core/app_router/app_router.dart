import 'package:flutter/material.dart';

class Route_Page{
  static void push({required BuildContext context, required var page}){
    Navigator.push(context, MaterialPageRoute(builder: (context)=>page));
}
  static void pop({required BuildContext context}){
    Navigator.pop(context);
  }
}