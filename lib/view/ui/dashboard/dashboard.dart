import 'package:flutter/material.dart';

import '../../../utils/widgets/bottom_navigation_bar.dart';
import '../downloads/download_screen.dart';
import '../home/home_screen.dart';
import '../new_hot/new_hot_screen.dart';
import '../notification/notification_screen.dart';
import '../profile/profile_screen.dart';

class DashboardScreen extends StatefulWidget {
  const DashboardScreen({super.key});

  @override
  State<DashboardScreen> createState() => _DashboardScreenState();
}

class _DashboardScreenState extends State<DashboardScreen> {
  int _currentIndex = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.transparent,
      extendBody: true,
      body: _buildBody(),
      bottomNavigationBar: BottomNavigationBarTab(
        onTap: (index) {
          setState(() {
            _currentIndex = index;
          });
        },
        currentIndex: _currentIndex,
      ),
    );
  }

  Widget _buildBody() {
    switch (_currentIndex) {
      case 0:
        return const HomeScreen();
      case 1:
        return const NewHotScreen();
      case 2:
        return const DownloadScreen();
      case 3:
        return const NotificationScreen();
      case 4:
        return const ProfileScreen();
      default:
        return Container();
    }
  }
}
