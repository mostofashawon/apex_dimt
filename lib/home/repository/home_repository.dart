import 'dart:convert';

import 'package:get/get_connect/connect.dart';
import 'package:http/http.dart 'as http;

import '../model/company.dart';

class HomeRepository extends GetConnect {
  @override
  void onInit() {
    httpClient.baseUrl = 'YOUR-API-URL';
  }






  Future<Company?> getCompanyList() async {



    final url = Uri.parse('http://139.59.35.127/apex-dmit/public/api/company');


    var response = await http.get(
        url,
    );


    print(response.statusCode.toString());


    if (response.statusCode == 200) {
      // var finalResponse = jsonDecode(response.body.toString());

      // var jsonResponse = json.decode(response.body);

      var jsonResponse = json.decode(response.body);




      try {
         if (jsonResponse['status_code'] == "1") {

           print("resssssssss............"+jsonResponse.toString());

          // print(jsonResponse.toString());

          // var jsonString = response.body;
          return companyFromJson(response.body);
          // return AllPost.fromJson(finalResponse);
         }
      } catch (e) {
        print(e.toString());
      }
    } else {
      return null;
    }
  }

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


    print(response.statusCode.toString());


    if (response.statusCode == 201) {
      // var finalResponse = jsonDecode(response.body.toString());

      var jsonResponse = json.decode(response.body);

      print(response.body.toString());

      try {
        if (jsonResponse['status_code'] == "1") {
          return true;
        }
      } catch (e) {
        print(e.toString());
      }
    } else {
      return false;
    }
  }




}