import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:my_gallery_app/common/containers/background_container.dart';
import 'package:my_gallery_app/views/home.dart';
import 'package:my_gallery_app/views/log_in.dart';

class AuthenticationRepository extends GetxController {
  static AuthenticationRepository get instance => Get.find();

  /// variables
 final _auth = FirebaseAuth.instance;


  /// called from main.dart on app launch
  @override
  void onReady() {
    screenRedirect();
  }

  /// function to show relevant screen
  screenRedirect() async {
    // Fetch current user fro firebase authentication
    final user = _auth.currentUser;

    // If there is a logged in user
    if (user != null) {
      Get.offAll(() => const HomePage());
    } else {
      Get.offAll(() => const LoginPage());
    }
  }


  /// [Logout] - Valid for any authentication
  Future<void> logout() async {
    try {
      await _auth.signOut();
      Get.offAll( () => const LoginPage());
    } on FirebaseAuthException catch (e) {
      throw e.toString();
    } on FirebaseException catch (e) {
      throw e.toString();
    } on FormatException catch (e) {
      throw e.toString();
    } on PlatformException catch (e) {
      throw e.toString();
    } catch (e) {
      throw 'Something went wrong. Pleas try again';
    }
  }

  /// [EmailAuthentication] - Login
  Future<UserCredential> loginWithEmailAndPassword(String email, String password) async {
    try {
      return await _auth.signInWithEmailAndPassword(email: email, password: password);
    } on FirebaseAuthException catch (e) {
      throw e.toString();
    } on FirebaseException catch (e) {
      throw e.toString();
    } on FormatException catch (e) {
      throw e.toString();
    } on PlatformException catch (e) {
      throw e.toString();
    } catch (e) {
      throw e.toString();
    }
  }
}