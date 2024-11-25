import 'package:edu_zone/modules/Login/view/splash_screen.dart';
import 'package:edu_zone/themes/app_theme.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class MyApp extends ConsumerStatefulWidget {
  final GlobalKey<NavigatorState>? navigatorKey;
  const MyApp({super.key, this.navigatorKey});

  @override
  ConsumerState<MyApp> createState() => _MyAppState();
}

class _MyAppState extends ConsumerState<MyApp> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      navigatorKey: widget.navigatorKey,
      theme: getAppTheme(context),
      debugShowCheckedModeBanner: false,
      home: const SplashScreenPage(),
    );
  }
}
