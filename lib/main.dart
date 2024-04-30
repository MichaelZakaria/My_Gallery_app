import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:my_gallery_app/data/authentication/authentication_repository.dart';
import 'app.dart';
import 'firebase_options.dart';

Future<void> main() async {
  /// widgets binding
 final WidgetsBinding widgetsBinding =  WidgetsFlutterBinding.ensureInitialized();


  /// Initialize firebase
  await Firebase.initializeApp(options: DefaultFirebaseOptions.currentPlatform).then(
          (FirebaseApp value) => Get.put(AuthenticationRepository()));


  runApp(const MyApp());
}

