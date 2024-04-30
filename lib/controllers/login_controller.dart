import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:my_gallery_app/views/home.dart';
import '../data/authentication/authentication_repository.dart';


class LoginController extends GetxController {


  final userName = TextEditingController();
  final password = TextEditingController();
  GlobalKey<FormState> loginFormKey = GlobalKey<FormState>();


  /// Email and Password SignIn
  Future<void> emailAndPasswordSignIn() async {
    try{
      // start loading
      showDialog(
        context: Get.overlayContext!,
          builder: (_) => PopScope(
              canPop: false, // disable popping with the back button
              child: Container(
                color: Colors.black.withOpacity(0.2),
                width: double.infinity,
                height: double.infinity,
                child: const Column(
                  children: [
                    SizedBox(height: 250,), // adjust the height as needed
                    CircularProgressIndicator()
                  ],
                ),
              )
          )
      );

      // form validation
      if(!loginFormKey.currentState!.validate()) {
        Navigator.of(Get.overlayContext!).pop();
        return;
      }

      // Login user using Email & Password Authentication
      final userCredential = await AuthenticationRepository.instance.loginWithEmailAndPassword(userName.text.trim(), password.text.trim());

      // remove loader
      Navigator.of(Get.overlayContext!).pop();

      // Redirect
      Get.off( () => const HomePage());

    } catch (e) {
      // remove loader
      Navigator.of(Get.overlayContext!).pop();

      // show some some generic error to user
      ScaffoldMessenger.of(Get.context!).showSnackBar(
          SnackBar(
              elevation: 0,
              duration: const Duration(seconds: 3),
              backgroundColor: Colors.transparent,
              content: Container(
                padding: const EdgeInsets.all(12),
                margin: const EdgeInsets.symmetric(horizontal: 5),
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(30),
                    color:Colors.red
                ),
                child: const Center(child: Text('Incorrect credentials, please try again', style: TextStyle(color: Colors.white))),
              )
          )
      );
    }
  }
}