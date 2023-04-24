import 'dart:io';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';
import 'package:imape_api/image_controller.dart';

class ImageUpload extends StatefulWidget {
  const ImageUpload({Key? key}) : super(key: key);

  @override
  _ImageUploadState createState() => _ImageUploadState();
}

class _ImageUploadState extends State<ImageUpload> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        drawer: Drawer(),
        appBar: AppBar(
          backgroundColor: Colors.deepPurple,
          title: const Text('Image upload to API'),
        ),
        body: GetBuilder<ImageController>(builder: (imageController) {
          return Padding(
            padding: const EdgeInsets.fromLTRB(15, 35, 15, 35),
            child: Column(children: [
              Center(
                child: SizedBox(
                  height: 50,
                  width: 300,
                  child: ElevatedButton(
                    style: ElevatedButton.styleFrom(primary: Colors.deepPurple),
                    child: const Text(
                      'Select an Image!',
                      style: TextStyle(fontSize: 15),
                    ),
                    onPressed: () => imageController.pickImage(),
                  ),
                ),
              ),
              const SizedBox(height: 35),
              Container(
                alignment: Alignment.center,
                height: 210,
                width: 310,
                color: Colors.black,
                child: Container(
                  alignment: Alignment.center,
                  height: 200,
                  width: 300,
                  color: Colors.grey[300],
                  child: imageController.pickedFile != null
                      ? Image.file(
                          File(imageController.pickedFile!.path),
                          width: 300,
                          height: 200,
                          fit: BoxFit.cover,
                        )
                      : const Text('Please select an image'),
                ),
              ),
              SizedBox(height: 40),
              Center(
                child: SizedBox(
                  height: 50,
                  width: 300,
                  child: ElevatedButton(
                      style:
                          ElevatedButton.styleFrom(primary: Colors.deepPurple),
                      child: const Text(
                        'Upload Image',
                        style: TextStyle(fontSize: 15),
                      ),
                      onPressed: () => Get.find<ImageController>().upload()),
                ),
              ),
            ]),
          );
        }));
  }
}
