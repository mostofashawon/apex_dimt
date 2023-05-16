

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:get/get.dart';
import 'package:get/get_state_manager/src/simple/get_view.dart';

import '../component/custom_text_widget.dart';
import '../component/custom_textformfield_widget.dart';
import '../controller/home_controller.dart';


class HomeView extends GetView<HomeController>{


  HomeController controller = Get.put(HomeController());


  @override
  Widget build(BuildContext context) {
    var screenHeight = MediaQuery.of(context).size.height;
    var screenWidth = MediaQuery.of(context).size.width;

    return 
      SafeArea(child: Scaffold(
        appBar: AppBar(
          title: Text("Company List",style: TextStyle(
            color: Colors.black
          ),),
          elevation: 0,
          centerTitle: true,
          backgroundColor: Colors.white,
        ),
      floatingActionButton: GestureDetector(
        onTap: (){

          showDialog(
            context: context,
            builder: (BuildContext) {
              return AlertDialog(
                icon:  Row(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                     GestureDetector(
                       onTap: (){
                         Navigator.pop(context);
                       },
                       child: Icon(
                          Icons.cancel
                    ),
                     ),
                  ],

                ),
                title: Center(child: Text("Create New Company")),
                titleTextStyle: TextStyle(
                    fontSize:  screenHeight * 0.020,
                    fontWeight: FontWeight.bold,
                    color: Colors.black
                ),
                content: Column(
                  mainAxisSize: MainAxisSize.min,
                  children: [

                    SizedBox(height: screenHeight * 0.010,),
                    CustomTextFormField(screenHeight,screenWidth,"Company Name",controller),
                    // Container(
                    //   width: screenWidth * 0.800,
                    //   height: screenHeight * 0.060,
                    //   decoration: BoxDecoration(
                    //       border: Border.all(
                    //           color: Colors.grey
                    //       ),
                    //       borderRadius: BorderRadius.circular(10.0),
                    //       color: Colors.white.withOpacity(0.6)
                    //   ),
                    //   // color: Colors.green,
                    //   child: Padding(
                    //     padding:  EdgeInsets.only(
                    //         top: screenHeight * 0.005,
                    //         left: screenWidth * 0.005
                    //     ),
                    //     child: TextFormField(
                    //       // textAlign: TextAlign.center,
                    //       decoration: InputDecoration(
                    //         hintText: "Company Name",
                    //         border: InputBorder.none,
                    //       ),
                    //       onChanged:(searchVal){
                    //          controller.companyName.value = searchVal.toString();
                    //       },
                    //     ),
                    //   ),
                    // ),
                    SizedBox(height: screenHeight * 0.020,),
                    CustomTextFormField(screenHeight,screenWidth,"Work Email",controller),
                    // Container(
                    //   width: screenWidth * 0.800,
                    //   height: screenHeight * 0.060,
                    //   decoration: BoxDecoration(
                    //       border: Border.all(
                    //           color: Colors.grey
                    //       ),
                    //       borderRadius: BorderRadius.circular(10.0),
                    //       color: Colors.white.withOpacity(0.6)
                    //   ),
                    //   // color: Colors.green,
                    //   child: Padding(
                    //     padding:  EdgeInsets.only(
                    //         top: screenHeight * 0.005,
                    //         left: screenWidth * 0.005
                    //     ),
                    //     child: TextFormField(
                    //       keyboardType: TextInputType.emailAddress,
                    //       // textAlign: TextAlign.center,
                    //       decoration: InputDecoration(
                    //         hintText: "Work Email",
                    //         border: InputBorder.none,
                    //       ),
                    //       onChanged:(searchVal){
                    //          controller.email.value = searchVal.toString();
                    //       },
                    //     ),
                    //   ),
                    // ),
                    SizedBox(height: screenHeight * 0.020,),
                    CustomTextFormField(screenHeight,screenWidth,"Password",controller),
                    // Container(
                    //   width: screenWidth * 0.800,
                    //   height: screenHeight * 0.060,
                    //   decoration: BoxDecoration(
                    //       border: Border.all(
                    //           color: Colors.grey
                    //       ),
                    //       borderRadius: BorderRadius.circular(10.0),
                    //       color: Colors.white.withOpacity(0.6)
                    //   ),
                    //   // color: Colors.green,
                    //   child: Padding(
                    //     padding:  EdgeInsets.only(
                    //         top: screenHeight * 0.005,
                    //         left: screenWidth * 0.005
                    //     ),
                    //     child: TextFormField(
                    //       obscureText: true,
                    //       decoration: InputDecoration(
                    //         hintText: "Password",
                    //         border: InputBorder.none,
                    //       ),
                    //       onChanged:(searchVal){
                    //          controller.password.value = searchVal.toString();
                    //       },
                    //     ),
                    //   ),
                    // ),
                    SizedBox(height: screenHeight * 0.020,),
                    CustomTextFormField(screenHeight,screenWidth,"Phone",controller),
                    // Container(
                    //   width: screenWidth * 0.800,
                    //   height: screenHeight * 0.060,
                    //   decoration: BoxDecoration(
                    //       border: Border.all(
                    //           color: Colors.grey
                    //       ),
                    //       borderRadius: BorderRadius.circular(10.0),
                    //       color: Colors.white.withOpacity(0.6)
                    //   ),
                    //   // color: Colors.green,
                    //   child: Padding(
                    //     padding:  EdgeInsets.only(
                    //         top: screenHeight * 0.005,
                    //         left: screenWidth * 0.005
                    //     ),
                    //     child: TextFormField(
                    //       keyboardType: TextInputType.phone,
                    //       // textAlign: TextAlign.center,
                    //       decoration: InputDecoration(
                    //         hintText: "Phone",
                    //         border: InputBorder.none,
                    //       ),
                    //       onChanged:(searchVal){
                    //         controller.phone.value = searchVal.toString();
                    //       },
                    //     ),
                    //   ),
                    // ),
                    SizedBox(height: screenHeight * 0.020,),
                    GestureDetector(
                      onTap: () async {
                        if(controller.companyName.value == ''&&
                            controller.email.value == ''&&
                            controller.phone.value == ''&&
                            controller.password.value == '') {

                          Get.snackbar(
                            "Warning",
                            "Please fill up all the field",
                            colorText: Colors.white,
                            backgroundColor: Colors.red,
                            snackPosition: SnackPosition.BOTTOM,

                          );

                        }
                        else if(controller.companyName.value == ''  ||
                            controller.email.value == '' ||
                            controller.phone.value == ''||
                            controller.password.value == ''){

                          Get.snackbar(
                            "Warning",
                            "Please fill up all the field",
                            colorText: Colors.white,
                            backgroundColor: Colors.red,
                            snackPosition: SnackPosition.BOTTOM,

                          );

                        }
                        else if( controller.password.value.toString().length < 7){
                          Get.snackbar(
                            "Warning",
                            "The password must be at least 7 characters",
                            colorText: Colors.white,
                            backgroundColor: Colors.red,
                            snackPosition: SnackPosition.BOTTOM,

                          );
                        }
                        else if( controller.phone.value.toString().length < 7 ||
                            controller.phone.value.toString().length > 15){
                          Get.snackbar(
                            "Warning",
                            "The phone must be between 9 and 15 digits",
                            colorText: Colors.white,
                            backgroundColor: Colors.red,
                            snackPosition: SnackPosition.BOTTOM,

                          );
                        }
                        else {
                          var status = await controller.addNewCompany();
                          if(status == true){
                            Get.snackbar(
                              "Success",
                              "New Company created ",
                              colorText: Colors.white,
                              backgroundColor: Color(0xff25A5A3),
                              snackPosition: SnackPosition.BOTTOM,

                            );
                            Navigator.pop(context);
                            controller.fetchCompanyList();
                          }
                        }
                      },
                      child: Container(
                        width: screenWidth * 0.800,
                        height: screenHeight * 0.060,
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(10.0),
                            color: Color(0xff25A5A3),
                        ),
                        // color: Colors.green,
                        child: Center(
                          child: Text(
                            "Create a New Company",
                            style: TextStyle(
                                color: Colors.white,
                              fontSize: screenHeight * 0.020
                            ),
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              );
            },
          );



        },
        child: Container(
          height: screenHeight * 0.040,
          width: screenWidth  * 0.25,
          decoration: BoxDecoration(
            color: Color(0xff25A5A3),
            borderRadius: BorderRadius.circular(
                screenHeight * 0.020
            )
          ),
          child: Center(
            child: Text("Create  Company",style: TextStyle(
                color: Colors.white,
                 fontSize: screenHeight * 0.013,
            ),),
          )
        ),
      ),
      body: Container(
        height: screenHeight,
        width: screenWidth,
        child: Obx(() => controller.isLoading.value == true ? Center(
          child: CircularProgressIndicator(),
        ) : ListView.builder(
            itemCount:controller.company.value.companyList!.data!.length ,
            itemBuilder: (context,index){
              return Card(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: CustomText(controller.company.value.companyList!.data![index].companyName.toString(),screenHeight * 0.022,FontWeight.bold),
                    ),
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: CustomText(controller.company.value.companyList!.data![index].email.toString(),screenHeight * 0.018,FontWeight.w100),
                    ),
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: CustomText(controller.company.value.companyList!.data![index].phone.toString(),screenHeight * 0.018,FontWeight.w100),
                    ),
                  ],
                ),
              );
            }),)
        
      ),
    ));
  }


}