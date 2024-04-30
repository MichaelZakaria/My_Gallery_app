import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:my_gallery_app/views/log_in.dart';

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return const GetMaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(backgroundColor: Colors.white, body: Center(child: CircularProgressIndicator(color: Colors.grey,),),),
    );
  }
}