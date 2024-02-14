import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';

import '../../../../utils/base_constants/base_assets.dart';
import '../../../../utils/base_constants/base_strings.dart';
import '../../../../utils/base_constants/text_style.dart';

class RegisterTermsRow extends StatefulWidget {
  const RegisterTermsRow({super.key});

  @override
  State<RegisterTermsRow> createState() => _RegisterTermsRowState();
}

class _RegisterTermsRowState extends State<RegisterTermsRow> {
  bool isTermsAccepted = false;

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Row(
      children: [
        Padding(
          padding: const EdgeInsets.all(8.0),
          child: InkWell(
            onTap: () {
              setState(() {
                isTermsAccepted = !isTermsAccepted;
              });
            },
            child: Image.asset(
              isTermsAccepted
                  ? BaseAssets.checkedIcon
                  : BaseAssets.unCheckedIcon,
              width: size.width * 0.05,
            ),
          ),
        ),
        RichText(
          text: TextSpan(
            children: [
              TextSpan(
                text: BaseStrings.accept,
                recognizer: TapGestureRecognizer()
                  ..onTap = () {
                    setState(() {
                      isTermsAccepted = !isTermsAccepted;
                    });
                  },
                style: BaseTextStyles.planSubDescriptionText,
              ),
              const TextSpan(
                  text: BaseStrings.privacyPolicy,
                  style: BaseTextStyles.planSubDescriptionUnderlineText),
              const TextSpan(
                text: BaseStrings.and,
                style: BaseTextStyles.planSubDescriptionText,
              ),
              const TextSpan(
                text: BaseStrings.termsConditions,
                style: BaseTextStyles.whiteTextUnderline,
              ),
            ],
          ),
        ),
      ],
    );
  }
}
