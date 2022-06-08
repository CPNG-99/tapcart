import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

// colors
const Color kLightBrown = Color(0xFFE1B854);
const Color kRichBlack = Color(0xFF000814);
const Color kGrey = Color(0xFFB7B4B4);

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

// text theme
final kTextTheme =
    TextTheme(headline5: kHeading, subtitle1: kSubtitle, bodyText2: kBodyText)
        .apply(bodyColor: kRichBlack, displayColor: kRichBlack);

const kColorScheme = ColorScheme(
  primary: Colors.white,
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
