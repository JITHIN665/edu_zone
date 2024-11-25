import 'package:flutter/material.dart';

Map<int, Color> color = {
  50: const Color.fromRGBO(136, 14, 79, .1),
  100: const Color.fromRGBO(136, 14, 79, .2),
  200: const Color.fromRGBO(136, 14, 79, .3),
  300: const Color.fromRGBO(136, 14, 79, .4),
  400: const Color.fromRGBO(136, 14, 79, .5),
  500: const Color.fromRGBO(136, 14, 79, .6),
  600: const Color.fromRGBO(136, 14, 79, .7),
  700: const Color.fromRGBO(136, 14, 79, .8),
  800: const Color.fromRGBO(136, 14, 79, .9),
  900: const Color.fromRGBO(136, 14, 79, 1),
};

class AppColors extends ThemeExtension<AppColors> {
  final Color? background;
  final Color? primary;
  final Color? primaryText;
  final Color? secondaryText;
  final Color? text;
  final Color? subText;
  final Color? errorText;
  final Color? white;
  final Color? border;
  final List<Color>? gradient;
  final Color? warningButton;
  final Color? green;
  final Color? statusButtonGrey;
  final Color? statusButtonRed;
  final Color? statusButtonGreen;
  final Color? statusButtonYellow;
  final Color? statusButtonBlue;
  final Color? statusButtonYellowTwo;
  final Color? buttonColor;
  final Color? badge;
  final Color? tabBackground;
  final Color? black;
  final Color? otpBackground;
  final Color? fullWhite;
  final Color? primaryLight;
  final List<Color>? paymentGradientOne;
  final List<Color>? paymentGradientTwo;
  final Color? borderColor;
  final Color? dotColor;
  final Color? progressColor;
  final Color? statusBox;
  final Color? statusPercentage;
  final Color? shimmerBaseColor;
  final Color? popupActiveColor;
  final Color? secondaryBackground;
  final Color? tertiaryText;
  final Color? activityTextColor;
  const AppColors({
    required this.background,
    required this.primary,
    required this.primaryText,
    required this.secondaryText,
    required this.text,
    required this.subText,
    required this.errorText,
    required this.white,
    required this.badge,
    required this.tabBackground,
    required this.border,
    required this.gradient,
    required this.warningButton,
    required this.green,
    required this.statusButtonGrey,
    required this.statusButtonRed,
    required this.statusButtonGreen,
    required this.statusButtonYellow,
    required this.statusButtonBlue,
    required this.statusButtonYellowTwo,
    required this.buttonColor,
    required this.black,
    required this.otpBackground,
    required this.fullWhite,
    required this.primaryLight,
    required this.paymentGradientOne,
    required this.paymentGradientTwo,
    required this.borderColor,
    required this.dotColor,
    required this.progressColor,
    required this.statusBox,
    required this.statusPercentage,
    required this.shimmerBaseColor,
    required this.popupActiveColor,
    required this.secondaryBackground,
    required this.tertiaryText,
    required this.activityTextColor,
  });

  @override
  AppColors copyWith({
    Color? background,
    Color? primary,
    Color? primaryText,
    Color? secondaryText,
    Color? text,
    Color? subText,
    Color? errorText,
    Color? white,
    Color? border,
    List<Color>? gradient,
    Color? warningButton,
    Color? green,
    Color? statusButtonGrey,
    Color? statusButtonRed,
    Color? statusButtonGreen,
    Color? statusButtonYellow,
    Color? statusButtonBlue,
    Color? statusButtonYellowTwo,
    Color? buttonColor,
    Color? badge,
    Color? tabBackground,
    Color? black,
    Color? otpBackground,
    Color? fullWhite,
    Color? primaryLight,
    List<Color>? paymentGradientOne,
    List<Color>? paymentGradientTwo,
    Color? borderColor,
    Color? dotColor,
    Color? progressColor,
    Color? statusBox,
    Color? statusPercentage,
    Color? shimmerBaseColor,
    Color? popupActiveColor,
    Color? secondaryBackground,
    Color? tertiaryText,
    Color? activityTextColor,
  }) {
    return AppColors(
        background: background ?? this.background,
        primary: primary ?? this.primary,
        primaryText: primaryText ?? this.primaryText,
        secondaryText: secondaryText ?? this.secondaryText,
        text: text ?? this.text,
        subText: subText ?? this.subText,
        errorText: errorText ?? this.errorText,
        white: white ?? this.white,
        border: border ?? this.border,
        gradient: gradient ?? this.gradient,
        warningButton: warningButton ?? this.warningButton,
        green: green ?? this.green,
        statusButtonGrey: statusButtonGrey ?? this.statusButtonGrey,
        statusButtonRed: statusButtonRed ?? this.statusButtonRed,
        statusButtonGreen: statusButtonGreen ?? this.statusButtonGreen,
        statusButtonYellow: statusButtonYellow ?? this.statusButtonYellow,
        statusButtonBlue: statusButtonBlue ?? this.statusButtonBlue,
        statusButtonYellowTwo: statusButtonYellowTwo ?? this.statusButtonYellowTwo,
        buttonColor: buttonColor ?? this.buttonColor,
        badge: badge ?? this.badge,
        tabBackground: tabBackground ?? this.tabBackground,
        black: black ?? this.black,
        otpBackground: otpBackground ?? this.otpBackground,
        fullWhite: fullWhite ?? this.fullWhite,
        primaryLight: primaryLight ?? this.primaryLight,
        paymentGradientOne: paymentGradientOne ?? this.paymentGradientOne,
        paymentGradientTwo: paymentGradientTwo ?? this.paymentGradientTwo,
        borderColor: borderColor ?? this.borderColor,
        dotColor: dotColor ?? this.dotColor,
        progressColor: progressColor ?? this.progressColor,
        statusBox: statusBox ?? this.statusBox,
        statusPercentage: statusPercentage ?? this.statusPercentage,
        shimmerBaseColor: shimmerBaseColor ?? this.shimmerBaseColor,
        popupActiveColor: popupActiveColor ?? this.popupActiveColor,
        secondaryBackground: secondaryBackground ?? this.secondaryBackground,
        tertiaryText: tertiaryText ?? this.tertiaryText,
        activityTextColor: activityTextColor ?? this.activityTextColor);
  }

  @override
  AppColors lerp(ThemeExtension<AppColors>? other, double t) {
    if (other is! AppColors) {
      return this;
    }
    return AppColors(
        background: Color.lerp(background, other.background, t),
        primary: Color.lerp(primary, other.primary, t),
        primaryText: Color.lerp(primaryText, other.primaryText, t),
        secondaryText: Color.lerp(secondaryText, other.secondaryText, t),
        text: Color.lerp(text, other.text, t),
        subText: Color.lerp(subText, other.subText, t),
        errorText: Color.lerp(errorText, other.errorText, t),
        white: Color.lerp(white, other.white, t),
        border: Color.lerp(border, other.border, t),
        gradient: gradient,
        warningButton: Color.lerp(warningButton, other.warningButton, t),
        green: Color.lerp(green, other.green, t),
        statusButtonGrey: Color.lerp(statusButtonGrey, other.statusButtonGrey, t),
        statusButtonRed: Color.lerp(statusButtonRed, other.statusButtonRed, t),
        statusButtonGreen: Color.lerp(statusButtonGreen, other.statusButtonGreen, t),
        statusButtonYellow: Color.lerp(statusButtonYellow, other.statusButtonYellow, t),
        statusButtonBlue: Color.lerp(statusButtonBlue, other.statusButtonBlue, t),
        statusButtonYellowTwo: Color.lerp(statusButtonYellowTwo, other.statusButtonYellowTwo, t),
        buttonColor: Color.lerp(buttonColor, other.buttonColor, t),
        badge: Color.lerp(badge, other.badge, t),
        tabBackground: Color.lerp(tabBackground, other.tabBackground, t),
        black: Color.lerp(black, other.black, t),
        otpBackground: Color.lerp(otpBackground, other.otpBackground, t),
        fullWhite: Color.lerp(fullWhite, other.fullWhite, t),
        primaryLight: Color.lerp(primaryLight, other.primaryLight, t),
        paymentGradientOne: paymentGradientOne,
        paymentGradientTwo: paymentGradientTwo,
        borderColor: Color.lerp(
          borderColor,
          other.borderColor,
          t,
        ),
        dotColor: Color.lerp(dotColor, other.dotColor, t),
        progressColor: Color.lerp(progressColor, other.progressColor, t),
        statusBox: Color.lerp(statusBox, other.statusBox, t),
        statusPercentage: Color.lerp(statusPercentage, other.statusPercentage, t),
        shimmerBaseColor: Color.lerp(shimmerBaseColor, other.shimmerBaseColor, t),
        popupActiveColor: Color.lerp(popupActiveColor, other.popupActiveColor, t),
        secondaryBackground: Color.lerp(secondaryBackground, other.secondaryBackground, t),
        tertiaryText: Color.lerp(tertiaryText, other.tertiaryText, t),
        activityTextColor: Color.lerp(activityTextColor, activityTextColor, t));
  }
}
