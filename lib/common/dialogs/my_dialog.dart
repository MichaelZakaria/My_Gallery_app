import 'dart:ui';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';
import 'package:my_gallery_app/common/buttons/my_elevated_button.dart';
import 'package:my_gallery_app/common/buttons/my_home_elevated_button.dart';
import '../../controllers/image_controller.dart';

class MyDialog extends StatelessWidget {
  const MyDialog({
    super.key,
    required this.controller,
  });

  final dynamic controller;

  @override
  Widget build(BuildContext context) {

    return Align(
        alignment: Alignment.center,
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 50, vertical: 280),
          child: Container(
            decoration: BoxDecoration(
                border: Border.all(color: Colors.white, width: 2),
                borderRadius: BorderRadius.circular(52)
            ),
            child: ClipRRect(
              borderRadius: BorderRadius.circular(50),
              child: Container(
                  color: Colors.transparent,
                  height: double.infinity,
                  width: double.infinity,
                  child: BackdropFilter(
                    filter: ImageFilter.blur(sigmaX: 10, sigmaY: 10),
                    child: Center(
                      child: Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 50),
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            SizedBox(
                                width: double.infinity ,
                                child: MyHomeElevatedButton(
                                  icon: const Icon(Icons.image, ),
                                  onPressed: () {
                                      controller.uploadPicture(ImageSource.gallery);
                                      Navigator.pop(context);
                                  },
                                  text: 'Gallery',
                                  iconColor: const Color(0xFFddcdff),
                                  buttonColor: const Color(0xFFFDD2F6).withRed(-15),
                                  angle: -0.5,
                                )
                            ),
                            const SizedBox(height: 35,),
                            SizedBox(
                                width: double.infinity ,
                                child: MyHomeElevatedButton(
                                  onPressed: () {
                                    controller.uploadPicture(ImageSource.camera);
                                    Navigator.pop(context);
                                  },
                                  icon:Icon(Icons.camera_alt, color:Colors.grey[600]),
                                  text: 'Camera',
                                  iconColor: const Color(0xA2C4FFFF),
                                  buttonColor: const Color(0xC4D7FFFF),
                                  angle: -0.5,
                                )
                            ),
                          ],
                        ),
                      ),
                    ),
                  )
              ),
            ),
          ),
        ));
  }
}