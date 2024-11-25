import 'package:edu_zone/modules/home/view/home_screen.dart';
import 'package:edu_zone/modules/notifications/view/notification_screen.dart';
import 'package:edu_zone/modules/settings/view/settings_screen.dart';
import 'package:edu_zone/themes/app_theme.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class BottomNavigation extends ConsumerWidget {
  final String activeIcon;
  const BottomNavigation({super.key, this.activeIcon = ''});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Wrap(
      alignment: WrapAlignment.center,
      children: [
        Container(
          padding: const EdgeInsets.symmetric(horizontal: 10),
          width: double.infinity,
          height: 80,
          decoration: BoxDecoration(
            color: appColor(context).badge?.withOpacity(0.2),
          ),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            mainAxisSize: MainAxisSize.min,
            children: [
              Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  Stack(
                    children: [
                      IconButton(
                          splashRadius: 1,
                          enableFeedback: false,
                          onPressed: () {
                            Navigator.push(context, HomeScreen.route());
                          },
                          icon: Image.asset(
                            activeIcon == "home" ? "assets/icons/home_active.png" : 'assets/icons/home.png',
                            height: 26,
                            width: 26,
                          )),
                    ],
                  ),
                  Text(
                    'Home',
                    style: TextStyle(fontSize: 12, fontWeight: FontWeight.w600, color: appColor(context).text),
                  )
                ],
              ),
              Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  IconButton(
                      splashRadius: 1,
                      enableFeedback: false,
                      onPressed: () async {
                        Navigator.push(context, SettingsScreen.route());
                      },
                      icon: Image.asset(
                        activeIcon == "sett" ? "assets/icons/settings_icon_filled.png" : 'assets/icons/settings_icon.png',
                        height: 26,
                        width: 26,
                      )),
                  Text(
                    'Settings',
                    style: TextStyle(fontSize: 12, fontWeight: FontWeight.w600, color: appColor(context).text),
                  )
                ],
              ),
              Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  IconButton(
                    splashRadius: 1,
                    enableFeedback: false,
                    onPressed: () {
                       Navigator.push(context, NotificationScreen.route());
                    },
                    icon: Image.asset(
                      activeIcon == "notification" ? "assets/icons/notification_with_dot_active.png" : 'assets/icons/notification_with_dot.png',
                      height: 28,
                      width: 28,
                    ),
                  ),
                  Text(
                    'Notification',
                    style: TextStyle(fontSize: 12, fontWeight: FontWeight.w600, color: appColor(context).text),
                  )
                ],
              ),
            ],
          ),
        ),
      ],
    );
  }
}
