import 'package:flutter/material.dart';

import '../../../../utils/base_constants/base_colors.dart';
import '../../../../utils/base_constants/base_strings.dart';
import '../../../../utils/base_constants/text_style.dart';
import '../../../../utils/widgets/text_view.dart';
import '../../dashboard/dashboard.dart';

class DownloadInvoiceButton extends StatefulWidget {
  const DownloadInvoiceButton({super.key});

  @override
  State<DownloadInvoiceButton> createState() => DownloadInvoiceButtonState();
}

class DownloadInvoiceButtonState extends State<DownloadInvoiceButton> {
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return TextButton(
      onPressed: () {
        Navigator.of(context).pushAndRemoveUntil(
          MaterialPageRoute(builder: (context) => const DashboardScreen()),
          (route) => false,
        );
      },
      style: ButtonStyle(
        shape: MaterialStateProperty.all(RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(10),
            side: const BorderSide(color: BaseColors.blackBorderColor))),
        fixedSize: MaterialStateProperty.resolveWith((states) {
          return Size(
            size.width,
            size.height * 0.056,
          );
        }),
        backgroundColor: MaterialStateProperty.resolveWith<Color?>(
          (Set<MaterialState> states) {
            if (states.contains(MaterialState.selected)) {
              return BaseColors.searchBgColor;
            }
            return BaseColors.searchBgColor; // defer to the defaults
          },
        ),
      ),
      child: const Center(
        child: TextView(
          BaseStrings.downloadInvoice,
          textStyle: BaseTextStyles.downloadButtonText,
        ),
      ),
    );
  }
}
