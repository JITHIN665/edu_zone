import 'dart:async';

import 'package:edu_zone/modules/home/view/home_screen.dart';
import 'package:edu_zone/themes/app_theme.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class SplashScreenPage extends ConsumerStatefulWidget {
  const SplashScreenPage({super.key});

  @override
  ConsumerState<SplashScreenPage> createState() => _SplashScreenPageState();
}

class _SplashScreenPageState extends ConsumerState<SplashScreenPage> {
  bool _isExpanded = false;
  bool _showText = false;
  bool _isFadeIn = false;

  @override
  void initState() {
    super.initState();
    _startAnimation(); 
  }

  void _startAnimation() {
    Timer(const Duration(milliseconds: 1200), () {
      setState(() {
        _isFadeIn = true;
      });
    });
    // Start the logo animation after a short delay
    Timer(const Duration(milliseconds: 2100), () {
      setState(() {
        _isExpanded = true; // Expand the logo and move it up
      });

      // Fade in the text 500ms after the logo animation
      Timer(const Duration(milliseconds: 500), () {
        setState(() {
          _showText = true;
        });
      });

      Timer(const Duration(milliseconds: 1000), () async {
        if (mounted) {
          Navigator.push(context, HomeScreen.route());
        }
      });
      // });
    });
  }

  @override
  Widget build(BuildContext context) {
    WidgetsBinding.instance.addPostFrameCallback((timeStamp) async {});
    return Scaffold(
      body: Stack(
        children: [
          Container(
            decoration: const BoxDecoration(
              image: DecorationImage(
                image: AssetImage('assets/images/splash_screen.png'),
                fit: BoxFit.cover,
              ),
            ),
          ),

          // Animated Positioned Logo
          AnimatedPositioned(
            duration: const Duration(milliseconds: 700),
            curve: Curves.easeInOut,
            top: _isExpanded ? 305 : MediaQuery.of(context).size.height / 2 - 40,
            left: _isExpanded ? MediaQuery.of(context).size.width / 2 - 30 : MediaQuery.of(context).size.width / 2 - 45,
            right: _isExpanded ? MediaQuery.of(context).size.width / 2 - 30 : MediaQuery.of(context).size.width / 2 - 45,
            child: Hero(
              tag: 'logo',
              child: AnimatedOpacity(
                duration: const Duration(milliseconds: 600),
                opacity: _isFadeIn ? 1.0 : 0.0,
                child: AnimatedContainer(
                  duration: const Duration(milliseconds: 600),
                  curve: Curves.easeInOut,
                  width: _isExpanded ? 150 : 200,
                  child: Image.asset('assets/icons/trogon.png'),
                ),
              ),
            ),
          ),

          // Fade-in Text with AnimatedOpacity
          Positioned.fill(
            top: 455,
            child: AnimatedOpacity(
              duration: const Duration(milliseconds: 500),
              opacity: _showText ? 1.0 : 0.0,
              child: Column(
                children: [
                  const SizedBox(height: 3),
                  Text(
                    "Welcome to Trogon Edu Zone.",
                    style: TextStyle(
                      color: appColor(context).white,
                      fontSize: 14,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
