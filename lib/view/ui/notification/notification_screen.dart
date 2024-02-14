import 'package:flutter/material.dart';

import '../../../utils/base_constants/base_assets.dart';
import '../../../utils/base_constants/base_colors.dart';
import '../../../utils/base_constants/base_extensions.dart';
import 'notification_components/notification_card.dart';

class NotificationScreen extends StatefulWidget {
  const NotificationScreen({super.key});

  @override
  State<NotificationScreen> createState() => _NotificationScreenState();
}

class _NotificationScreenState extends State<NotificationScreen> {
  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return Scaffold(
      backgroundColor: BaseColors.primaryColor,
      appBar: AppBar(
        backgroundColor: BaseColors.primaryColor,
        elevation: 0,
        centerTitle: false,
        title: Padding(
          padding: const EdgeInsets.only(left: 8.0),
          child: SizedBox(
              width: size.width * 0.2,
              child: Image.asset(
                BaseAssets.grioImageLogo,
              )),
        ),
        actions: [
          10.toHSB,
          const Padding(
            padding: EdgeInsets.only(right: 20),
            child: Icon(
              Icons.search,
              size: 25,
              color: BaseColors.white,
            ),
          ),
        ],
      ),
      body: SafeArea(
        child: SingleChildScrollView(
          child: Column(
            children: [
              ListView.builder(
                shrinkWrap: true,
                itemCount: 10,
                physics: const NeverScrollableScrollPhysics(),
                itemBuilder: (context, index) {
                  return const Padding(
                    padding: EdgeInsets.symmetric(horizontal: 20, vertical: 5),
                    child: NotificationCard(),
                  );
                },
              ),
              20.toVSB
            ],
          ),
        ),
      ),
    );
  }
}
