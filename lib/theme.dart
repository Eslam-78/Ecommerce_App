import 'package:flutter/material.dart';
import 'package:store_app/constants.dart';
import 'package:store_app/size_config.dart';

ThemeData theme(BuildContext context) {
  return ThemeData.dark().copyWith(
    textTheme: textTheme().apply(fontFamily: 'Poppins'),
    inputDecorationTheme: inputDecorationTheme(context),
    scaffoldBackgroundColor: blackBackground,
    appBarTheme: appBarTheme(),
    colorScheme: colorScheme(),
  );
}

InputDecorationTheme inputDecorationTheme(BuildContext context) {
  OutlineInputBorder outlineInputBorder = OutlineInputBorder(
    borderRadius: BorderRadius.circular(20),
    borderSide: BorderSide(color: purpleText),
    gapPadding: 10,
  );
  return InputDecorationTheme(
    hintStyle: Theme.of(
      context,
    ).textTheme.bodyLarge!.copyWith(color: Colors.white.withOpacity(0.4)),
    contentPadding: EdgeInsets.symmetric(horizontal: 45, vertical: 20),
    enabledBorder: outlineInputBorder,
    focusedBorder: outlineInputBorder,
    border: outlineInputBorder,
  );
}

ColorScheme colorScheme() {
  return ColorScheme.dark(
    primary: Colors.deepPurpleAccent,
    secondary: Colors.amber,
  );
}

TextTheme textTheme() {
  return TextTheme(
    bodyLarge: TextStyle(color: textSecondary),
    bodyMedium: TextStyle(color: textSecondary),
  );
}

AppBarTheme appBarTheme() {
  return AppBarTheme(
    centerTitle: true,
    iconTheme: IconThemeData(color: Colors.deepPurple),
    backgroundColor: blackBackground,
    elevation: 0,
    titleTextStyle: TextStyle(
      color: purpleText,
      fontSize: getProportionateScreenHeight(20),
      fontWeight: FontWeight.bold,
    ),
  );
}
