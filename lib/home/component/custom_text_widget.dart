

import 'package:flutter/cupertino.dart';

Widget CustomText(String title,double fontSize,FontWeight weight){
  return Text(title,style: TextStyle(
    fontSize: fontSize,
    fontWeight: weight
  ),);
}