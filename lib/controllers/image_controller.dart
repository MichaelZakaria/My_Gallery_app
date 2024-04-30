import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';
import 'package:my_gallery_app/data/images/image_repository.dart';

class ImageController extends GetxController {
  static ImageController get instance => Get.find();

  final RxList<String> images = <String>[].obs;

  final imageUploading = false.obs;

  RxBool refreshData = true.obs;

  final repository = Get.put(ImageRepository());

  /// Upload image
  Future<void> uploadPicture(ImageSource imageSource) async {
    try {
      final image = await ImagePicker().pickImage(source: imageSource, imageQuality: 70, maxHeight: 512, maxWidth: 512);
      if (image != null) {
        imageUploading.value = true;
        // upload image
        final imageUrl = await repository.uploadImage('Users/Images/', image);

        // Update user image record
        //Map<String, dynamic> json = {'Images': imageUrl};
        await repository.updateSingleField(imageUrl);

        //user.value.profilePicture = imageUrl;
        //user.refresh();

        //MyLoaders.successSnackBar(title: 'Congratulations', message: 'Your profile image has been updated!');
        refreshData.toggle();
      }
    } catch (e) {
      throw e.toString();
      //MyLoaders.errorSnackBar(title: 'OhSnap', message: 'Something went wrong: $e');
    } finally {
      imageUploading.value = false;
    }
  }

  /// Fetch all images
  Future<List<String>> getAllUserImages() async {
    try {
      final List<String> list = [];
      final images = await repository.fetchUserImages();
      if(images != null) {
        for (var element in images) {
          list.add(element.toString());
        }
        return list;
      }
      return [];
    } catch (e) {
      throw e.toString();
      //MyLoaders.errorSnackBar(title: 'Address not found', message: e.toString());
    }
  }
}