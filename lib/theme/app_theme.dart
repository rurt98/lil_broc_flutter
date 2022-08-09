import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

mixin AppTheme {
  static Color? lilBrocGreen = const Color(0xff00B68A);
  static Color? lilBrocOrange = const Color(0xffEF6C42);

  static BoxDecoration boxDecoration() {
    return BoxDecoration(
      color: Colors.white,
      borderRadius: const BorderRadius.all(
        Radius.circular(15),
      ),
      boxShadow: [
        BoxShadow(
          color: Colors.grey.withOpacity(0.4),
          blurRadius: 10,
        )
      ],
    );
  }

  static ThemeData generalTheme(BuildContext context) {
    final textTheme = GoogleFonts.montserratTextTheme(
      Theme.of(context).textTheme,
    ).apply(
      bodyColor: Colors.black,
    );

    final iconTheme = IconThemeData(
      color: Colors.black.withOpacity(0.7),
    );

    return ThemeData(
      primaryColor: const Color(0xff00B68A),
      primaryColorLight: const Color(0xffD5F6E1),
      backgroundColor: const Color(0xffFCFBF7),
      textTheme: textTheme,
      appBarTheme: AppBarTheme(
        elevation: 0.0,
        color: Colors.transparent,
        centerTitle: false,
        iconTheme: iconTheme,
        // titleTextStyle: TextStyle(
        //   color: greyDark,
        //   fontWeight: FontWeight.bold,
        //   fontSize: 20,
        // ),
      ),
      inputDecorationTheme: InputDecorationTheme(
        labelStyle: const TextStyle(color: Colors.grey),
        fillColor: Colors.white,
        filled: true,
        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(50.0),
          borderSide: const BorderSide(
            color: Colors.transparent,
            width: 2.0,
          ),
        ),
        enabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(50.0),
          borderSide: const BorderSide(
            color: Colors.transparent,
            width: 0,
          ),
        ),
        errorBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(50.0),
          borderSide: BorderSide(
            color: lilBrocOrange!,
            width: 0,
          ),
        ),
        focusedErrorBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(50.0),
          borderSide: const BorderSide(
            color: Colors.transparent,
            width: 0,
          ),
        ),
      ),
      colorScheme: const ColorScheme.light()
          .copyWith(
            primary: lilBrocGreen,
          )
          .copyWith(secondary: lilBrocGreen),
    );
  }
}
