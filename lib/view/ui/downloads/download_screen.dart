import 'package:flutter/material.dart';
import 'package:grio_plus/utils/base_constants/base_colors.dart';
import 'package:grio_plus/utils/base_constants/base_strings.dart';
import 'package:grio_plus/utils/widgets/text_view.dart';

class DownloadScreen extends StatefulWidget {
  const DownloadScreen({super.key});

  @override
  State<DownloadScreen> createState() => _DownloadScreenState();
}

class _DownloadScreenState extends State<DownloadScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: BaseColors.textGreyColor,
        centerTitle: true,
        title: const TextView(BaseStrings.download),
        elevation: 1,
      ),
      body: Container(
        color: BaseColors.textGreyColor,
      ),
    );
  }
}
