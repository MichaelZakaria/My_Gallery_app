import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';
import 'package:my_gallery_app/data/images/image_repository.dart';

class UserImageController extends GetxController {
  static UserImageController get instance => Get.find();

  final RxString userImage = ''.obs;

  RxBool refreshData = true.obs;

  final repository = ImageRepository.instance;


  @override
  void onInit() async {
    await getAUserImage();
    super.onInit();
  }

  /// Upload image
  Future<void> uploadPicture(ImageSource imageSource) async {
    try {
      final image = await ImagePicker().pickImage(source: imageSource, imageQuality: 70, maxHeight: 512, maxWidth: 512);
      if (image != null) {
        // upload image
        final imageUrl = await repository.uploadImage('UserImages/', image);

        // Update user image record
        await repository.updateUserImage(imageUrl);


        userImage.value = imageUrl;

        refreshData.toggle();
      }
    } catch (e) {
      throw e.toString();
    }
  }

  /// Fetch user image
  Future<String?> getAUserImage() async {
    try {
      final userImage = await repository.fetchUserImage();
      if (userImage != null) {
        this.userImage.value = userImage.toString();
        return userImage;
      }
      return null;
    } catch (e) {
      throw e.toString();
    }
  }
}