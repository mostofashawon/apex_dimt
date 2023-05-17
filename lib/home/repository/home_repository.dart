import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_connect/connect.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:get/get_navigation/src/snackbar/snackbar.dart';
import 'package:http/http.dart 'as http;

import '../model/company.dart';

class HomeRepository extends GetConnect {
  @override
  void onInit() {
    httpClient.baseUrl = 'YOUR-API-URL';
  }



  // fetching company list from network



  Future<Company?> getCompanyList() async {


    final url = Uri.parse('http://139.59.35.127/apex-dmit/public/api/company');


    var response = await http.get(
        url,
    );

    if (response.statusCode == 200) {

      var jsonResponse = json.decode(response.body);

      try {
         if (jsonResponse['status_code'] == "1") {
          return companyFromJson(response.body);
         }
      } catch (e) {
        Get.snackbar(
          "Exception",
          e.toString(),
          colorText: Colors.white,
          backgroundColor: Colors.red,
          snackPosition: SnackPosition.BOTTOM,

        );
      }
    } else {
      return null;
    }
  }


  // upload new company to remote server

  Future<dynamic?> uploadNewCompany(String companyName,
      String email,
      String password,
      String phone,
      ) async {


    Map userData = Map();
    userData["company_name"] = companyName;
    userData["email"] = email;
    userData["password"] = password;
    userData["phone"] = phone;

    final url = Uri.parse('http://139.59.35.127/apex-dmit/public/api/company');


    var response = await http.post(
      url,
      body: userData
    );



    if (response.statusCode == 201) {

      var jsonResponse = json.decode(response.body);

      try {
        if (jsonResponse['status_code'] == "1") {
          return true;
        }
      } catch (e) {
        Get.snackbar(
          "Exception",
          e.toString(),
          colorText: Colors.white,
          backgroundColor: Colors.red,
          snackPosition: SnackPosition.BOTTOM,

        );
      }
    } else {
      return false;
    }
  }




}