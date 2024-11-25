import 'package:edu_zone/themes/app_theme.dart';
import 'package:flutter/material.dart';

class NoData extends StatelessWidget {
  final String image;
  final String text;
  final double? height;
  final double? width;
  final Widget? child;
  const NoData({
    super.key,
    required this.image,
    required this.text,
    this.height = 100,
    this.width = 100,
    this.child,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Image.asset(
          image,
          height: height,
          width: width,
        ),
        Padding(
          padding: const EdgeInsets.fromLTRB(70, 10, 70, 0),
          child: Text(
            text,
            style: TextStyle(
              fontSize: 13,
              color: appColor(context).secondaryText,
            ),
            textAlign: TextAlign.center,
          ),
        ),
        child != null ? child! : const SizedBox()
      ],
    );
  }
}
