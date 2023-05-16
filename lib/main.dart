import 'package:flutter/material.dart';
import 'package:get/get_navigation/src/root/get_material_app.dart';

import 'home/view/home_view.dart';

void main() {
  runApp( GetMaterialApp(
    debugShowCheckedModeBanner: false,
    title: "Test",
    theme: ThemeData(fontFamily: 'Poppins_Regular'),
    home:  HomeView(),
  ));
}

// class MyApp extends StatelessWidget {
//   const MyApp({super.key});
//
//   // This widget is the root of your application.
//   @override
//   Widget build(BuildContext context) {
//     return GetMaterialApp(
//       debugShowCheckedModeBanner: false,
//       title: "Test",
//       theme: ThemeData(fontFamily: 'Poppins_Regular'),
//       home:  HomeView(),
//     );
//   }
// }

