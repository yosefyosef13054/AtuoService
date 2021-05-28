import 'package:image_picker/image_picker.dart';
import 'dart:io';
import 'package:get/get.dart';

class GetImage {
  static Rx<File> imageFormGallery = Rx(File(""));
  static RxString galleryImage = RxString("");
  static final picker = ImagePicker();


  static Future imageFromGallery() async {
    final pickedFile = await picker.getImage(source: ImageSource.gallery);

    if (pickedFile != null) {
      imageFormGallery.value = File(pickedFile.path);
      galleryImage.value = pickedFile.path;
    } else {
      // print('No image selected from gallery.');
    }
  }
}
