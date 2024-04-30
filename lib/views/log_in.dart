import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:my_gallery_app/common/containers/background_container.dart';
import 'package:my_gallery_app/controllers/login_controller.dart';
import '../common/buttons/my_elevated_button.dart';
import '../common/containers/textfield_container.dart';

class LoginPage extends StatelessWidget {
  const LoginPage({super.key});

  @override
  Widget build(BuildContext context) {
    final controller = Get.put(LoginController());

    return Scaffold(
      body: SingleChildScrollView(
        child: MyBackGroundContainer(
          child: SingleChildScrollView(
            child: Center(
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 35, vertical: 60),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    /// Pics
                    // heart pic
                    Transform.rotate(
                      angle: 0.2,
                      child: const Padding(
                          padding: EdgeInsets.only(right: 60, bottom: 0),
                          child: Image(image: AssetImage("assets/vecteezy_cartoon-heart-shape-emoji_22095658.png"), height: 60,)
                      ),
                    ),

                    // camera pic
                    Transform.rotate(
                      angle: -0.2,
                      child: const Padding(
                          padding: EdgeInsets.only(right: 150, bottom: 20),
                          child: Image(image: AssetImage("assets/cartoon-camera-transparent-6.png"), height: 90,)
                      ),
                    ),

                    /// header
                    const Text('My', style: TextStyle(fontSize: 42,fontWeight: FontWeight.bold, color: Color(0xFF4A4A4A)),),
                    const Text('Gallery', style: TextStyle(fontSize: 42,fontWeight: FontWeight.bold, color: Color(0xFF4A4A4A))),

                    const SizedBox(height: 30,),

                    /// LogIn Form
                    Container(
                      padding: const EdgeInsets.all(20),
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(35),
                          color: Colors.white.withOpacity(0.3),
                          border: Border.all(color: Colors.white.withOpacity(0.2))
                      ),
                      child: Column(
                        children: [
                          const Text('LOG IN', style: TextStyle(fontSize: 32, fontWeight: FontWeight.bold, color: Color(0xFF4A4A4A))),

                          const SizedBox(height: 35,),

                          Form(
                            key: controller.loginFormKey,
                              child: Column(
                                children: [
                                  // username
                                  MyTextField(controller: controller.userName, labelText: 'User Name',),
                                  const SizedBox(height: 35,),
                                  // password
                                  MyTextField(controller: controller.password, labelText: 'Password'),
                                  const SizedBox(height: 35,),
                                  // submit button
                                  MyElevatedButton(onPressed: () => controller.emailAndPasswordSignIn(),)
                                ],
                              )
                          )
                        ],
                      ),
                    )
                  ],
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}