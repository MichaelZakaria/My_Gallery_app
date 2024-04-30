import 'dart:ui';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:my_gallery_app/common/containers/background_container.dart';
import 'package:my_gallery_app/controllers/image_controller.dart';
import 'package:my_gallery_app/data/authentication/authentication_repository.dart';
import '../common/appbar/my_appbar.dart';
import '../common/buttons/my_home_elevated_button.dart';
import '../common/dialogs/my_dialog.dart';
import '../common/images/my_full_images.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    final controller = Get.put(ImageController());

    return Scaffold(
      body: SingleChildScrollView(
        child: MyBackGroundContainer(
          left: 0,
          child: SingleChildScrollView(
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 50),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  /// Appbar
                  const MyAppBar(),

                  const SizedBox(height: 40,),

                  /// Logout - Upload buttons
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      MyHomeElevatedButton(
                        icon: const Icon(Icons.arrow_back_rounded, color: Colors.white,),
                        onPressed: () => AuthenticationRepository().logout(),
                        text: 'Log out',
                        iconColor: Colors.red,
                      ),

                      MyHomeElevatedButton(
                        icon: const Icon(Icons.arrow_upward_rounded, color: Colors.white,),
                        onPressed: () {
                          showGeneralDialog(
                              context: context,
                              pageBuilder: (_,__,___) {
                                return MyDialog(controller: controller);
                              },
                              barrierDismissible: true,
                              barrierLabel: MaterialLocalizations.of(context)
                                  .modalBarrierDismissLabel,
                              barrierColor: Colors.transparent,
                              transitionDuration: const Duration(milliseconds: 150));
                        },
                        text: 'Upload',
                        iconColor: Colors.orangeAccent,
                      ),
                    ],
                  ),

                  const SizedBox(height: 25,),

                  /// All users Images
                  const MyFullImages()
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}








