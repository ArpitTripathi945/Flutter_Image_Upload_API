import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:imape_api/image_controller.dart';
import 'package:imape_api/image_upload.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    //Initialised GetX Controller
    Get.lazyPut(() => ImageController());

    return MaterialApp(
      title: 'Flutter Demo',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: ImageUpload(),
    );
  }
}
