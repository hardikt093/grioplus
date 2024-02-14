import 'package:flutter/material.dart';

import '../../../utils/base_constants/base_colors.dart';
import '../../../utils/base_constants/base_extensions.dart';
import '../../../utils/base_constants/base_strings.dart';
import '../../../utils/base_constants/text_style.dart';
import '../../../utils/widgets/button_widget.dart';
import '../../../utils/widgets/text_view.dart';
import 'edit_profile_components/edit_profile_fields.dart';
import 'edit_profile_components/edit_profile_image.dart';

class EditProfileScreen extends StatefulWidget {
  const EditProfileScreen({super.key});

  @override
  State<EditProfileScreen> createState() => _EditProfileScreenState();
}

class _EditProfileScreenState extends State<EditProfileScreen> {
  final editProfileFormKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: BaseColors.primaryColor,
        floatingActionButton: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20.0),
          child: CustomFormButton(
            backgroundColor: BaseColors.secondaryYellowColor,
            buttonText: BaseStrings.updateProfile,
            onPressed: () {
              FocusScope.of(context).unfocus();
              updateProfileButton(context);
            },
            textColor: BaseColors.white,
          ),
        ),
        floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
        appBar: AppBar(
          iconTheme: const IconThemeData(
            color: BaseColors.white,
          ),
          automaticallyImplyLeading: true,
          centerTitle: true,
          title: const TextView(
            BaseStrings.editProfile,
            textStyle: BaseTextStyles.appBarText,
          ),
        ),
        body: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20.0),
          child: SingleChildScrollView(
            child: Column(children: [
              const EditProfileImage(),
              30.toVSB,
              EditProfileFields(
                editProfileFormKey: editProfileFormKey,
              ),
              30.toVSB,
            ]),
          ),
        ));
  }

  void updateProfileButton(BuildContext context) {
    if (editProfileFormKey.currentState!.validate()) {}
  }
}
