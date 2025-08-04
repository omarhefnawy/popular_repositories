import 'package:flutter/material.dart';

class AppResponsive {
  static double width(BuildContext context) =>
      MediaQuery.of(context).size.width;

  static double height(BuildContext context) =>
      MediaQuery.of(context).size.height;

  static Orientation orientation(BuildContext context) =>
      MediaQuery.of(context).orientation;

  static bool isMobile(BuildContext context) =>
      MediaQuery.of(context).size.width < 600;

  static bool isTablet(BuildContext context) {
    final width = MediaQuery.of(context).size.width;
    return width >= 600 && width < 1024;
  }

  static bool isDesktop(BuildContext context) =>
      MediaQuery.of(context).size.width >= 1024;
  static double bodyHeight(BuildContext context, {double appBarHeight = kToolbarHeight}) {
    final mediaQuery = MediaQuery.of(context);
    return mediaQuery.size.height - mediaQuery.padding.top - appBarHeight;
  }
  static double bodyHeightWithBottomNav(BuildContext context,
      {double appBarHeight = kToolbarHeight, double bottomNavHeight = kBottomNavigationBarHeight}) {
    final mediaQuery = MediaQuery.of(context);
    return mediaQuery.size.height -
        mediaQuery.padding.top -
        appBarHeight -
        bottomNavHeight;
  }
}
