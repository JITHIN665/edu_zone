import 'package:edu_zone/themes/app_theme.dart';
import 'package:flutter/material.dart';

class CommonAppbar extends StatelessWidget {
  final Widget? actionWidget;
  final Widget? titleWidget;
  final String title;
  final String? subTitle;
  final TextStyle? titleStyle;
  final double? toolbarHeight;
  final Color? arrowColor;
  final Color? backgroundColor;

  const CommonAppbar(
      {super.key,
      this.actionWidget,
      this.titleWidget,
      required this.title,
      this.titleStyle,
      this.subTitle,
      this.toolbarHeight = 65,
      this.arrowColor,
      this.backgroundColor});

  @override
  Widget build(BuildContext context) {
    return AppBar(
      toolbarHeight: toolbarHeight,
      backgroundColor: backgroundColor ?? appColor(context).text,
      automaticallyImplyLeading: false,
      centerTitle: false,
      title: Padding(
        padding: const EdgeInsets.only(top: 50.0, bottom: 18),
        child: Column(
          children: [
            Row(
              children: [
                IconButton(
                  padding: const EdgeInsets.only(left: 5),
                  alignment: Alignment.centerLeft,
                  icon: Icon(
                    Icons.arrow_back_ios_new,
                    color: arrowColor ?? appColor(context).background,
                  ),
                  onPressed: () {
                    Navigator.pop(context);
                  },
                ),
                Text(
                  title,
                  overflow: TextOverflow.ellipsis,
                  maxLines: 1,
                  style: titleStyle ??
                      TextStyle(
                        color: appColor(context).white,
                        fontSize: 16,
                        fontWeight: FontWeight.w600,
                      ),
                ),
                const SizedBox(
                  width: 10,
                ),
                titleWidget ?? const SizedBox(),
                const Spacer(),
                actionWidget ?? const SizedBox()
              ],
            ),
          ],
        ),
      ),
    );
  }
}
