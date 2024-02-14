import 'package:flutter/material.dart';
import 'package:grio_plus/utils/base_constants/text_style.dart';

import '../../../utils/base_constants/base_assets.dart';
import '../../../utils/base_constants/base_colors.dart';
import '../../../utils/base_constants/base_extensions.dart';
import '../../../utils/base_constants/base_strings.dart';
import '../../../utils/common/common_row_with_decoration.dart';
import '../../../utils/widgets/button_widget.dart';
import '../../../utils/widgets/text_view.dart';
import '../../helper/validators.dart';

final List<String> reasons = [
  BaseStrings.reason1,
  BaseStrings.reason2,
  BaseStrings.reason3,
  BaseStrings.reason4,
  BaseStrings.reason5,
  BaseStrings.reason6,
];
int? selectedReason;
String? selectedReasonValue;

class DeleteAccountScreen extends StatefulWidget {
  const DeleteAccountScreen({super.key});

  @override
  State<DeleteAccountScreen> createState() => _DeleteAccountScreenState();
}

class _DeleteAccountScreenState extends State<DeleteAccountScreen> {
  final deleteAccountFormKey = GlobalKey<FormState>();
  final reasonController = TextEditingController();
  final validators = Validators();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: BaseColors.primaryColor,
      floatingActionButton: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20.0),
        child: CustomFormButton(
          backgroundColor: BaseColors.secondaryYellowColor,
          buttonText: BaseStrings.deleteAccount,
          onPressed: () {
            FocusScope.of(context).unfocus();
            deleteAccountButton(context);
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
          BaseStrings.deleteAccount,
          textStyle: BaseTextStyles.appBarText,
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20.0),
        child: SingleChildScrollView(
          child: Column(children: [
            const Align(
              alignment: Alignment.topLeft,
              child: TextView(
                BaseStrings.validReason,
                textStyle: BaseTextStyles.screenDescriptionText,
              ),
            ),
            20.toVSB,
            Form(
              key: deleteAccountFormKey,
              child: TextFormField(
                onTap: () {
                  showMenuOptionBottomSheet(context);
                },
                controller: reasonController,
                readOnly: true,
                maxLines: 1,
                autovalidateMode: AutovalidateMode.onUserInteraction,
                textAlignVertical: TextAlignVertical.center,
                style: BaseTextStyles.formFieldText,
                decoration: InputDecoration(
                  hintText: BaseStrings.selectValidReason,
                  hintStyle: BaseTextStyles.formHintText,
                  suffixIconConstraints:
                      const BoxConstraints(minWidth: 25, maxHeight: 20),
                  suffixIcon: Image.asset(BaseAssets.dropdownIcon),
                  errorStyle: BaseTextStyles.errorText,
                  isDense: true,
                  filled: true,
                  fillColor: BaseColors.searchBgColor,
                  contentPadding: const EdgeInsets.symmetric(
                      vertical: 5.0, horizontal: 10.0),
                  focusedBorder: const OutlineInputBorder(
                    borderRadius: BorderRadius.all(Radius.circular(10)),
                    borderSide:
                        BorderSide(width: 0.5, color: BaseColors.searchBgColor),
                  ),
                  enabledBorder: const OutlineInputBorder(
                    borderRadius: BorderRadius.all(Radius.circular(10)),
                    borderSide:
                        BorderSide(width: 0.5, color: BaseColors.searchBgColor),
                  ),
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(10.0),
                    borderSide:
                        const BorderSide(color: Colors.white, width: 0.0),
                  ),
                ),
                validator: (value) => validators.validateReason(value!),
              ),
            ),
          ]),
        ),
      ),
    );
  }

  void deleteAccountButton(BuildContext context) {
    if (deleteAccountFormKey.currentState!.validate()) {}
  }

  void showMenuOptionBottomSheet(
    BuildContext context, {
    final VoidCallback? onCameraPressed,
    final VoidCallback? onGalleryPressed,
  }) {
    showModalBottomSheet(
        context: context,
        builder: (BuildContext context) {
          Size size = MediaQuery.of(context).size;
          return Container(
            height: size.height * 0.45,
            width: double.infinity,
            decoration: const BoxDecoration(
                color: BaseColors.bottomNavigationBarColor,
                borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(24),
                    topRight: Radius.circular(24))),
            padding: const EdgeInsets.all(20),
            child: Column(
              children: [
                5.toVSB,
                Row(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    const TextView(
                      BaseStrings.selectReason,
                      textStyle: BaseTextStyles.categoriesHeaderText,
                    ),
                    InkWell(
                      onTap: () {
                        Navigator.of(context).pop();
                      },
                      child: Image.asset(
                        BaseAssets.closeIcon,
                        width: 16,
                        height: 16,
                      ),
                    )
                  ],
                ),
                20.toVSB,
                Expanded(
                  child: ListView.builder(
                      shrinkWrap: true,
                      itemCount: reasons.length,
                      itemBuilder: (context, int index) {
                        return CommonRowWithDecoration(
                          title: reasons[index],
                          onPressed: () {
                            setState(() {
                              if (selectedReason != index) {
                                selectedReason = index;
                                reasonController.text = reasons[index];
                              }
                              Navigator.pop(context);
                            });
                          },
                          textColor: BaseColors.white,
                          color: BaseColors.filterChipBgColor,
                          gradientColor: selectedReason != index
                              ? [
                                  Colors.transparent,
                                  Colors.transparent,
                                ]
                              : [
                                  BaseColors.secondaryYellowColor,
                                  BaseColors.secondaryYellowColor,
                                  BaseColors.secondaryYellowColor,
                                  BaseColors.secondaryYellowColor.withAlpha(90),
                                  BaseColors.secondaryYellowColor.withAlpha(80),
                                  BaseColors.secondaryYellowColor,
                                ],
                        );
                      }),
                ),
              ],
            ),
          );
        });
  }
}
