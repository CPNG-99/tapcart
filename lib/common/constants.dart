// ignore_for_file: constant_identifier_names

import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

// shared preferences
const String ACCESS_TOKEN = "ACCESS_TOKEN";

// response
const CONNECTION_FAILED = "Connection Failed";

// colors
const Color kLightBrown = Color(0xFFE1B854);
const Color kRichBlack = Color(0xFF000814);
const Color kGrey = Color(0xFFB7B4B4);
const Color kGreySoft = Color(0xFFD2D2D2);
const Color kRed = Color(0xFFFF0000);


// font style
final TextStyle kHeading = GoogleFonts.inter(
  fontSize: 24,
  fontWeight: FontWeight.w700,
);
final TextStyle kSubtitle =
    GoogleFonts.inter(fontSize: 14, fontWeight: FontWeight.w400);
final TextStyle kBodyText =
    GoogleFonts.inter(fontSize: 14, fontWeight: FontWeight.w400);
final TextStyle kButtonText =
    GoogleFonts.inter(fontSize: 16, fontWeight: FontWeight.bold);
final TextStyle kTitleCardText =
    GoogleFonts.inter(fontSize: 12, fontWeight: FontWeight.bold);
final TextStyle kSubtitleCard =
    GoogleFonts.inter(fontSize: 12, fontWeight: FontWeight.bold, color: kLightBrown);

// text theme
final kTextTheme = TextTheme(
    headline5: kHeading,
    subtitle1: kSubtitle,
    bodyText2: kBodyText)
    .apply(bodyColor: kRichBlack,
    displayColor: kRichBlack
);

//elevated button theme data
final kButtonThemeData = ElevatedButtonThemeData(
    style: ElevatedButton.styleFrom(
      primary: kLightBrown,
      fixedSize: const Size(350, 50),
      padding: const EdgeInsets.symmetric(
          vertical: 10, horizontal: 30),
      textStyle: kButtonText,
        shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(5)
        )
    )
);

const kColorScheme = ColorScheme(
  primary: kLightBrown,
  primaryContainer: kLightBrown,
  secondary: Colors.white,
  secondaryContainer: Colors.white,
  surface: kGrey,
  background: Colors.white,
  error: Colors.red,
  onPrimary: kRichBlack,
  onSecondary: kRichBlack,
  onSurface: kRichBlack,
  onBackground: kRichBlack,
  onError: Colors.white,
  brightness: Brightness.light,
);

class MyInputTheme {
  OutlineInputBorder _outlineInputBorder(Color color){
    return OutlineInputBorder(
      borderRadius: const BorderRadius.all(Radius.circular(5)),
      borderSide: BorderSide(
        color: color,
        width: 1,
      ),
    );
  }
  InputDecorationTheme theme() => InputDecorationTheme(
    contentPadding: const EdgeInsets.all(16),
    floatingLabelBehavior: FloatingLabelBehavior.never,
    constraints: const BoxConstraints(maxWidth: 350),
    enabledBorder: _outlineInputBorder(kGrey),
    errorBorder: _outlineInputBorder(Colors.red),
    focusedErrorBorder: _outlineInputBorder(Colors.red),
    focusedBorder: _outlineInputBorder(kLightBrown),
    disabledBorder: _outlineInputBorder(Colors.grey[400]!),
    floatingLabelStyle: kSubtitle,
    hintStyle: const TextStyle(color: kGrey, fontSize: 12)
  );
}
