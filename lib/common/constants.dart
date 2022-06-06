import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

// colors
const Color kLightBrown = Color(0xFFD4A373);
const Color kRichBlack = Color(0xFF000814);

// font style
final TextStyle kHeading = GoogleFonts.inter(
  fontSize: 24,
  fontWeight: FontWeight.w700,
);
final TextStyle kSubtitle =
    GoogleFonts.inter(fontSize: 14, fontWeight: FontWeight.w400);
final TextStyle kBodyText =
    GoogleFonts.inter(fontSize: 14, fontWeight: FontWeight.w400);

// text theme
final kTextTheme =
    TextTheme(headline5: kHeading, subtitle1: kSubtitle, bodyText2: kBodyText)
        .apply(bodyColor: kRichBlack, displayColor: kRichBlack);

const kColorScheme = ColorScheme(
  primary: kLightBrown,
  primaryContainer: kLightBrown,
  secondary: kRichBlack,
  secondaryContainer: Colors.white,
  surface: Colors.white,
  background: Colors.white,
  error: Colors.red,
  onPrimary: kRichBlack,
  onSecondary: kRichBlack,
  onSurface: kRichBlack,
  onBackground: kRichBlack,
  onError: Colors.white,
  brightness: Brightness.light,
);
