import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../bloc/auth_bloc/auth_bloc.dart';
import '../../../utils/base_constants/base_assets.dart';
import '../../../utils/base_constants/base_colors.dart';
import '../../../utils/base_constants/base_extensions.dart';
import '../../../utils/base_constants/base_keys.dart';
import '../../../utils/base_constants/base_strings.dart';
import '../../../utils/base_constants/text_style.dart';
import '../../../utils/widgets/loading_widget.dart';
import '../../../utils/widgets/text_view.dart';
import '../../helper/shared_data.dart';
import 'profile_components/profile_floating_logout_widget.dart';
import 'profile_components/profile_list_tiles.dart';
import 'profile_components/profile_user_data_widget.dart';

class ProfileScreen extends StatefulWidget {

  const ProfileScreen({super.key});

  @override
  State<ProfileScreen> createState() => _ProfileScreenState();
}

class _ProfileScreenState extends State<ProfileScreen> {
  SharedData sharedData = SharedData();
  dynamic userData;
  @override
  void initState() {
    getUserId();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return SafeArea(
      child: Scaffold(
        resizeToAvoidBottomInset: true,
        backgroundColor: BaseColors.primaryColor,
        appBar: AppBar(
          centerTitle: true,
          title: const TextView(
            BaseStrings.profile,
            textStyle: BaseTextStyles.appBarText,
          ),
          actions: [
            InkWell(
              highlightColor: Colors.transparent,
              splashFactory: NoSplash.splashFactory,
              onTap: () {
              },
              child: Padding(
                padding: const EdgeInsets.all(20.0),
                child: Image.asset(
                  BaseAssets.searchIcon,
                  width: size.width * 0.05,
                  height: size.height * 0.05,
                ),
              ),
            ),
          ],
        ),
        body: BlocBuilder<AuthBloc, AuthState>(
          builder: (BuildContext context, AuthState state) {
            return Stack(
              children: [
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 20.0),
                  child: Column(
                    children: [
                      Expanded(
                        child: SingleChildScrollView(
                          child: Column(
                            children: [
                               ProfileUserDataWidget(userData:userData),
                              8.toVSB,
                              const ProfileListTiles(),
                            ],
                          ),
                        ),
                      ),
                      const FloatingLogOutWidget()
                    ],
                  ),
                ),
                Visibility(
                  visible: state is AuthLoadingState ? true : false,
                  child: loadingWidget(context),
                )
              ],
            );
          },
        ),
      ),
    );
  }
  getUserId() async {
    userData = await sharedData.readUserInfo(BaseKeys.userInfo);
    debugPrint(userData);
  }
}
