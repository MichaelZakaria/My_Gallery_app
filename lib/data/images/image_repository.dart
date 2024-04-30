import 'dart:io';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';

class ImageRepository extends GetxController{
  static ImageRepository get instance => Get.find();

  final FirebaseFirestore _db = FirebaseFirestore.instance;

  /// Upload any image
  Future<String> uploadImage(String path, XFile image) async {
    try {
      final ref = FirebaseStorage.instance.ref(path).child(image.name);
      await ref.putFile(File(image.path));
      final url = await ref.getDownloadURL();
      return url;
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

  /// Update any field in a specific Users Collection
  Future<void> updateSingleField(String imagePath) async {
    try {
      await _db.collection("Users").doc(FirebaseAuth.instance.currentUser?.uid).update({"Images": FieldValue.arrayUnion([imagePath])});
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

  /// Update user image in the Users Collection
  Future<void> updateUserImage(String imagePath) async {
    try {
      await _db.collection("Users").doc(FirebaseAuth.instance.currentUser?.uid).update({"UserImage": imagePath});
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

  /// Fetch all Images
  Future<List<dynamic>?> fetchUserImages() async {
    try {
      final userId = FirebaseAuth.instance.currentUser?.uid;
      //if (userId.isEmpty) throw 'Unable to find user information, Try again in a few minutes';
      final result = await _db.collection('Users').doc(userId).get();
      if (result.exists) {
        final data = result.data();
        if (data?['Images'] != null) {
          return data?['Images'];
        }
      }
      return null;
    } catch (e) {
      throw 'Something went wrong while fetching Address information, please try again later';
    }
  }

  /// Fetch user images
  Future<String?> fetchUserImage() async {
    try {
      final userId = FirebaseAuth.instance.currentUser?.uid;
      //if (userId.isEmpty) throw 'Unable to find user information, Try again in a few minutes';
      final result = await _db.collection('Users').doc(userId).get();
      if (result.exists) {
        final data = result.data();
        if (data?['UserImage'] != null) {
          return data?['UserImage'].toString();
        }
      }
      return null;
    } catch (e) {
      throw 'Something went wrong while fetching Address information, please try again later';
    }
  }
}