

import 'package:flutter/cupertino.dart';
import 'package:image_picker/image_picker.dart';
import 'package:taskbygithub/profile/profile_model/profile.dart';

import 'Service/service.dart';


class ProfileModel extends ChangeNotifier {
  ImagePicker imagePicker = ImagePicker();
  final userService = UserService();

  // File? selectedImage;

  Profile  ? _profile ;


  Profile? get profile => _profile;

  Future<void> createProfile(
       { String  ? image, required String name, required String bio}) async{
    _profile = Profile(image: image!, name: name, bio: bio);
    await userService.addUser(
      Profile( image:  _profile!.image,  name: 'Nour Ahmed', bio: 'nour@example.com'),
    );
    notifyListeners();
  }

  // دالة لإزالة الصورة
  void  removeImage() {
    if (_profile != null) {
      _profile!.image = null; // تعيين الصورة إلى null
      notifyListeners(); // تحديث الـ UI
    }
  }

  Future<void> imageSelector(ImageSource source) async {
    XFile? image = await imagePicker.pickImage(source: source);

    if (image != null) {
      if (_profile != null) {
        _profile!.image =image.path;
      } else {
        _profile = Profile(image: image.path, name: '', bio: '');
      }


      notifyListeners();
    }
  }
}
