import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';

import '../../../../utils/base_constants/base_assets.dart';
import 'edit_photo.dart';

class EditProfileImage extends StatefulWidget {
  const EditProfileImage({super.key});

  @override
  State<EditProfileImage> createState() => _EditProfileImageState();
}

class _EditProfileImageState extends State<EditProfileImage> {
  XFile? image;
  final picker = ImagePicker();

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Center(
          child: Stack(children: [
            ClipRRect(
              borderRadius: BorderRadius.circular(6),
              child: Container(
                width: MediaQuery.of(context).size.height * 0.13,
                height: MediaQuery.of(context).size.height * 0.13,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(6),
                ),
                child: Image.asset(
                  BaseAssets.movieImage1,
                  fit: BoxFit.cover,
                ),
              ),
            ),
            Positioned(
              bottom: 5,
              right: 5,
              child: Image.asset(
                BaseAssets.cameraIcon,
                height: 20,
                width: 20,
              ),
            )
          ]),
        ),
      ],
    );
  }

  /// Method for sending a selected or taken photo to the EditPage
  Future selectOrTakePhoto(ImageSource imageSource) async {
    final pickedFile = await picker.pickImage(source: imageSource);

    setState(() {
      if (pickedFile != null) {
        image = XFile(pickedFile.path);

        Navigator.pushReplacement(
            context,
            MaterialPageRoute(
                builder: (context) => EditPhotoPage(image: image)));

        // Navigator.push(context, EditPhotoPage(image: image), );
      } else {
        debugPrint('No photo was selected or taken');
      }
    });
  }

}
