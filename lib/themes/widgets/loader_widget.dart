import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';

class LoaderWidget extends StatelessWidget {
  final double width;
  final double height;
  const LoaderWidget({super.key, this.width = 150, this.height = 150});

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Center(
          child: Lottie.asset("assets/lottie/loader.json", width: width, height: height),
        ),
      ],
    );
  }
}
