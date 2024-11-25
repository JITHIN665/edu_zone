import 'package:edu_zone/themes/app_theme.dart';
import 'package:edu_zone/themes/widgets/app_transition.dart';
import 'package:edu_zone/themes/widgets/bottom_navigation_bar.dart';
import 'package:edu_zone/themes/widgets/common_appbar.dart';
import 'package:edu_zone/themes/widgets/no_data.dart';
import 'package:flutter/material.dart';

class NotificationScreen extends StatelessWidget {
  const NotificationScreen({super.key});

  static Route route() {
    return AppFadeTransition(page: const NotificationScreen());
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: appColor(context).fullWhite,
      bottomNavigationBar: const BottomNavigation(activeIcon: "notification"),
      appBar: const PreferredSize(
        preferredSize: Size.fromHeight(75),
        child: CommonAppbar(
          toolbarHeight: 65,
          title: "Notifications",
        ),
      ),
      body: const Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Center(
            child: NoData(
              image: "assets/icons/no_data.png",
              text: "Nothing to show here",
            ),
          ),
        ],
      ),
    );
  }
}
