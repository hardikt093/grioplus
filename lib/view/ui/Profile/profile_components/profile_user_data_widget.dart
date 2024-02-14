import 'package:flutter/material.dart';

import '../../../../utils/base_constants/base_assets.dart';
import '../../../../utils/base_constants/base_colors.dart';
import '../../../../utils/base_constants/base_extensions.dart';
import '../../../../utils/base_constants/text_style.dart';
import '../../../../utils/widgets/text_view.dart';
import '../../EditProfile/edit_profile_screen.dart';

class ProfileUserDataWidget extends StatefulWidget {
  final dynamic userData;

  const ProfileUserDataWidget({super.key, this.userData = ""});

  @override
  State<ProfileUserDataWidget> createState() => _ProfileUserDataWidgetState();
}

class _ProfileUserDataWidgetState extends State<ProfileUserDataWidget> {
  @override
  Widget build(BuildContext context) {
    bool hasData = false;
    widget.userData != null || widget.userData is Map ? hasData = true : false;
    return Container(
      decoration: BoxDecoration(
          color: BaseColors.searchBgColor,
          border: Border.all(
            color: BaseColors.blackBorderColor,
          ),
          borderRadius: const BorderRadius.all(Radius.circular(10))),
      child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              ClipRRect(
                borderRadius: BorderRadius.circular(10), // Image border
                child: SizedBox.fromSize(
                  size: const Size.fromRadius(38), // Image radius
                  child: Image.asset(BaseAssets.movieImage1, fit: BoxFit.cover),
                ),
              ),
              8.toHSB,
              Flexible(
                child: Column(
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      mainAxisSize: MainAxisSize.max,
                      children: [
                        TextView(
                            hasData
                                ? widget.userData["firstName"] +
                                    " " +
                                    widget.userData["lastName"]
                                : "",
                            textStyle: BaseTextStyles.whiteText),
                        InkWell(
                          highlightColor: Colors.transparent,
                          splashFactory: NoSplash.splashFactory,
                          onTap: () {
                            Navigator.of(context).push(
                              MaterialPageRoute(
                                  builder: (context) =>
                                      const EditProfileScreen()),
                            );
                          },
                          child: Padding(
                            padding:
                                const EdgeInsets.symmetric(horizontal: 8.0),
                            child: Image.asset(
                              BaseAssets.editProfileIcon,
                              width: 20,
                              height: 20,
                            ),
                          ),
                        ),
                      ],
                    ),
                    5.toVSB,
                    Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        Image.asset(
                          BaseAssets.profileEmailIcon,
                          width: 20,
                          height: 20,
                        ),
                        8.toHSB,
                        Flexible(
                          child: TextView(
                              hasData ? widget.userData["email"] : "",
                              textOverflow: TextOverflow.ellipsis,
                              maxLines: 1,
                              textStyle: BaseTextStyles.emailText),
                        ),
                        8.toHSB,
                      ],
                    ),
                    5.toVSB,
                    Row(
                      children: [
                        Image.asset(
                          BaseAssets.profilePhoneIcon,
                          width: 20,
                          height: 20,
                        ),
                        8.toHSB,
                        TextView(
                            hasData ? widget.userData["mobile"].toString() : "",
                            textStyle: BaseTextStyles.emailText),
                      ],
                    )
                  ],
                ),
              )
            ],
          )),
    );
  }
}
