
// CONSTANTS
import 'package:flutter/material.dart';

import 'activity.dart';

const kBackgroundColor = Colors.deepPurpleAccent;
const kSelectedColor = Colors.orange;
const kTextColorOnDarkSurface = Color(0xFFFFFFFF);
const kTextColorOnLightSurface = Color(0xFF000000);
const kWhiteColor = Color(0xFFFFFFFF);
const kGreyColor = Color(0xFFd6d4d4);
const kOrangeColor = Colors.orange;

// DEFS
typedef ActivityCallBack = void Function(Activity);
typedef ActivitiesCallBack = void Function(List<Activity>);


// THEME
final kTheme = ThemeData.light().copyWith(
  scaffoldBackgroundColor: kBackgroundColor,
  primaryTextTheme: const TextTheme(
      bodyText1: TextStyle(color: kTextColorOnDarkSurface),
      headline5: TextStyle(
          color: kTextColorOnDarkSurface, fontWeight: FontWeight.bold)),
  textTheme: const TextTheme(
      bodyText1: TextStyle(color: kTextColorOnLightSurface),
      headline5: TextStyle(
          color: kTextColorOnLightSurface, fontWeight: FontWeight.bold)),
  );


// EXTENSIONS
extension BuildContextX on BuildContext {
  ThemeData get theme => Theme.of(this);
  TextTheme get primaryTextTheme => theme.primaryTextTheme;
  TextTheme get textTheme => theme.textTheme;
  double get width => MediaQuery.of(this).size.width;
  double get height => MediaQuery.of(this).size.height;
}
