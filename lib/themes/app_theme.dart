import 'package:edu_zone/themes/colors.dart';
import 'package:flutter/material.dart';

AppColors appColor(context) => Theme.of(context).extension<AppColors>()!;

ThemeData getAppTheme(BuildContext context) {
  return ThemeData(
    extensions: const <ThemeExtension<AppColors>>[
      AppColors(
        background: Color(0xfff5f5f5),
        primary: Color(0xff0f1738),
        primaryText: Color(0xff0f1738),
        secondaryText: Color(0xff4b578c),
        text: Color(0xff1E1F21),
        subText: Color(0xff858a9a),
        errorText: Color(0xffdb292a),
        white: Color(0xffFAFBFF),
        badge: Color(0xffFF9393),
        tabBackground: Color(0xffECEFFF),
        border: Color(0xffECE5D3),
        gradient: [
          Color(0xff2640BA),
          Color(0xffFB6C76),
        ],
        warningButton: Color(0xff0094FF),
        green: Color(0xff48A61C),
        statusButtonGrey: Color(0xff6A6A6D),
        statusButtonRed: Color(0xffBB2F38),
        statusButtonGreen: Color(0xff0E7B61),
        statusButtonYellow: Color(0xffEB7A00),
        statusButtonBlue: Color(0xff0958D9),
        statusButtonYellowTwo: Color(0xffC58138),
        buttonColor: Color(0xff4B578C),
        black: Color(0xff000000),
        otpBackground: Color(0xfff8f9ff),
        fullWhite: Colors.white,
        primaryLight: Color(0xff33367C),
        paymentGradientOne: [
          Color(0xffAFB2FF),
          Color(0xffEDEEFF),
        ],
        paymentGradientTwo: [
          Color(0xffEAEAE6),
          Color(0xffFDFF8F),
        ],
        borderColor: Color(0xff909197),
        dotColor: Color(0xffD36A80),
        progressColor: Color(0xffB6630A),
        statusBox: Color(0xffC9CEE9),
        statusPercentage: Color(0xff374151),
        shimmerBaseColor: Color(0xffE3E3E3),
        popupActiveColor: Color(0xffF3F3F3),
        secondaryBackground: Color(0xff0055FF),
        tertiaryText: Color(0xffE5E5EF),
        activityTextColor: Color(0xff6D71F1),
      ),
    ],
    scaffoldBackgroundColor: Colors.white,
    textTheme: Theme.of(context)
        .textTheme
        .copyWith(
          titleSmall: Theme.of(context).textTheme.titleSmall?.copyWith(fontSize: 12),
        )
        .apply(
          bodyColor: const Color(0xff1E1F21),
          displayColor: Colors.grey,
        ),
    appBarTheme: const AppBarTheme(backgroundColor: Colors.white, iconTheme: IconThemeData(color: Colors.black54)),
    platform: TargetPlatform.iOS,
    primarySwatch: MaterialColor(0xffE21E26, color),
    primaryColor: const Color(0xff0f1738),
    fontFamily: 'Inter',
  );
}
