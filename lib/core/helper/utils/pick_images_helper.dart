import 'dart:io';

import 'package:image_picker/image_picker.dart';
import '../../resources/app_constant.dart';

Future<File?> pickSingleImg() async {
  final imagePicker = ImagePicker();
  try {
    XFile? pickedImgData = await imagePicker.pickImage(
        source: ImageSource.gallery, imageQuality: 85);
    testPrint(pickedImgData != null);
    if (pickedImgData != null) {
      return File(pickedImgData.path);
    }
  } catch (err) {
    showToast(text: 'Error Accured', state: ToastStates.ERROR);
  }
}

Future<List<File>> pickMultiImgs() async {
  final imagePicker = ImagePicker();
  List<File> imagesFiles = [];
  try {
    List<XFile> pickedImgsData = await imagePicker.pickMultiImage(
      // source: ImageSource.gallery,
      imageQuality: 85,
    );
    for (var file in pickedImgsData) {
      imagesFiles.add(File(file.path));
    }
  } catch (err) {
    showToast(text: 'Error Accured', state: ToastStates.ERROR);
  }
  return imagesFiles;
}
