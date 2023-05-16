
import 'package:apex_dimt/home/controller/home_controller.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

Widget CustomTextFormField(double screenHeight, double screenWidth,
    String hintText,HomeController controller){
  return Container(
    width: screenWidth * 0.800,
    height: screenHeight * 0.060,
    decoration: BoxDecoration(
        border: Border.all(
            color: Colors.grey
        ),
        borderRadius: BorderRadius.circular(10.0),
        color: Colors.white.withOpacity(0.6)
    ),
    // color: Colors.green,
    child: Padding(
      padding:  EdgeInsets.only(
          top: screenHeight * 0.005,
          left: screenWidth * 0.015
      ),
      child: TextFormField(
        decoration: InputDecoration(

          hintText: hintText,
          border: InputBorder.none,
        ),
        obscureText: hintText == "Password" ? true : false,
        keyboardType:  hintText == "Company Name" ? TextInputType.text :
        hintText == "Work Email" ? TextInputType.emailAddress :
        hintText == "Password" ?TextInputType.text : TextInputType.phone ,
        onChanged:(searchVal){
          hintText == "Company Name" ?
          controller.companyName.value = searchVal.toString() :
          hintText == "Work Email" ?  controller.email.value = searchVal.toString() :
          hintText == "Password" ? controller.password.value = searchVal.toString() :
          controller.phone.value = searchVal.toString();
        },
      ),
    ),
  );
}