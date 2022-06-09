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
      fixedSize: const Size(300, 50),
      padding: const EdgeInsets.symmetric(
          vertical: 10, horizontal: 30),
      textStyle: kButtonText,
        shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(5)
        )
    )
);

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

class MyInputTheme {
  OutlineInputBorder _outlineInputBorder(Color color){
    return OutlineInputBorder(
      borderRadius: BorderRadius.all(Radius.circular(5)),
      borderSide: BorderSide(
        color: color,
        width: 1,
      ),
    );
  }
  InputDecorationTheme theme() => InputDecorationTheme(
    contentPadding: EdgeInsets.all(16),
    floatingLabelBehavior: FloatingLabelBehavior.never,
    constraints: BoxConstraints(maxWidth: 300),

    enabledBorder: _outlineInputBorder(kGrey),
    errorBorder: _outlineInputBorder(Colors.red),
    focusedErrorBorder: _outlineInputBorder(Colors.red),
    focusedBorder: _outlineInputBorder(kLightBrown),
    disabledBorder: _outlineInputBorder(Colors.grey[400]!),

  );
}
