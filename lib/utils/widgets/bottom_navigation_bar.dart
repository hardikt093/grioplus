import 'package:flutter/material.dart';

import '../base_constants/base_assets.dart';
import '../base_constants/base_colors.dart';
import '../base_constants/base_strings.dart';

class BottomNavigationBarTab extends StatefulWidget {
  const BottomNavigationBarTab({super.key, this.onTap, this.currentIndex});

  final void Function(int)? onTap;
  final int? currentIndex;

  @override
  State<BottomNavigationBarTab> createState() => _BottomNavigationBarTabState();
}

class _BottomNavigationBarTabState extends State<BottomNavigationBarTab> {
  @override
  Widget build(BuildContext context) {
    return Theme(
      data: Theme.of(context).copyWith(
        canvasColor: BaseColors.bottomNavigationBarColor,
        bottomNavigationBarTheme: const BottomNavigationBarThemeData(
          unselectedLabelStyle: TextStyle(
              color: BaseColors.bottomNavigationTextColor,
              fontSize: 10,
              fontWeight: FontWeight.w400),
          selectedLabelStyle: TextStyle(
              color: BaseColors.secondaryYellowColor,
              fontSize: 10,
              fontWeight: FontWeight.w600),
        ),
        textTheme: Theme.of(context)
            .textTheme
            .copyWith(bodySmall: const TextStyle(color: Colors.yellow)),
      ),
      child: Container(
        decoration: const BoxDecoration(
            borderRadius: BorderRadius.only(
                topLeft: Radius.circular(24), topRight: Radius.circular(24)),
            color: BaseColors.bottomNavigationBarColor),
        child: ClipRRect(
          borderRadius: const BorderRadius.only(
              topLeft: Radius.circular(24), topRight: Radius.circular(24)),
          child: BottomNavigationBar(
            backgroundColor: BaseColors.bottomNavigationBarColor,
            selectedFontSize: 10,
            unselectedFontSize: 10,
            onTap: widget.onTap,
            currentIndex: widget.currentIndex ?? 0,
            type: BottomNavigationBarType.fixed,
            unselectedItemColor: BaseColors.bottomNavigationTextColor,
            selectedItemColor: BaseColors.secondaryYellowColor,
            selectedIconTheme: const IconThemeData(color: Colors.white),
            showUnselectedLabels: true,
            unselectedLabelStyle: const TextStyle(
                color: BaseColors.white,
                fontSize: 10,
                fontWeight: FontWeight.w400),
            selectedLabelStyle: const TextStyle(
                color: BaseColors.secondaryYellowColor,
                fontSize: 10,
                fontWeight: FontWeight.w600),
            items: [
              BottomNavigationBarItem(
                activeIcon: navigationCommonItem(
                  image: widget.currentIndex == 0
                      ? BaseAssets.homeWhite
                      : BaseAssets.homeWhite,
                ),
                icon: Image.asset(
                  widget.currentIndex == 0
                      ? BaseAssets.homeWhite
                      : BaseAssets.homeGrey,
                  width: 35,
                  height: 35,
                ),
                label: BaseStrings.home,
              ),
              BottomNavigationBarItem(
                activeIcon: navigationCommonItem(
                  image: BaseAssets.newHotWhite,
                ),
                icon: Image.asset(
                  BaseAssets.newHotGrey,
                  width: 35,
                  height: 35,
                ),
                label: BaseStrings.newHot,
              ),
              BottomNavigationBarItem(
                activeIcon: navigationCommonItem(
                  image: BaseAssets.downloadWhite,
                ),
                icon: Image.asset(
                  BaseAssets.downloadGrey,
                  width: 35,
                  height: 35,
                ),
                label: BaseStrings.downloads,
              ),
              BottomNavigationBarItem(
                icon: Image.asset(
                  BaseAssets.notificationGrey,
                  width: 35,
                  height: 35,
                ),
                activeIcon: navigationCommonItem(
                  image: BaseAssets.notificationWhite,
                ),
                label: BaseStrings.notifications,
              ),
              BottomNavigationBarItem(
                activeIcon: navigationCommonItem(
                  image: BaseAssets.profileWhite,
                ),
                icon: Image.asset(
                  BaseAssets.profileGrey,
                  width: 35,
                  height: 35,
                ),
                label: BaseStrings.profile,
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget navigationCommonItem(
      {String? title, String? image, Color? colors, bool? isSelected}) {
    return Container(
      width: 35,
      height: 35,
      decoration: BoxDecoration(
          color: BaseColors.secondaryYellowColor,
          borderRadius: BorderRadius.circular(14)),
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 0, vertical: 0),
        child: Center(
            child: Image.asset(
          image ?? '',
          width: 20,
          height: 20,
        )),
      ),
    );
  }
}
