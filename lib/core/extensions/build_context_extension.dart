import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:storefront/core/loggers/debug_logger.dart';

extension ContextExtension on BuildContext {
  MediaQueryData get mediaQuery => MediaQuery.of(this);

  double get screenHeight => mediaQuery.size.height;
  double get screenWidth => mediaQuery.size.width;

  ThemeData get theme => Theme.of(this);
  TextTheme get textTheme => theme.textTheme;

  double get defaultPadding => 16.w;
  double get bottomPadding => MediaQuery.paddingOf(this).bottom;
  double get topPadding => MediaQuery.paddingOf(this).top;

  // /////////////////////////////////////////
  // ! Navigation Ext
  // /////////////////////////////////////////

  /// Navigator.push
  Future<T?> push<T>(Route<T> route) {
    navigationLog("navigation: push routeName = '${route.settings.name}'");
    return Navigator.push(this, route);
  }

  /// Navigator.pushReplacement
  Future<T?> replace<T>(Route<T> route) {
    navigationLog("navigation: replace routeName = '${route.settings.name}'");
    return Navigator.pushReplacement(this, route);
  }

  /// Navigator.pushAndRemoveUntil
  Future<T?> pushAndRemoveUntil<T>(Route<T> route) {
    navigationLog(
      "navigation: pushAndRemoveUntil routeName = '${route.settings.name}'",
    );
    return Navigator.pushAndRemoveUntil(
      this,
      route,
      (route) => false,
    );
  }

  /// Navigator.pop
  void pop<T>([T? result]) {
    navigationLog("navigation: pop");
    Navigator.pop(this, result);
  }

  void popUntil<T>(Route<T> expectedRoute) {
    navigationLog("navigation: popUntil");
    Navigator.popUntil(
      this,
      (route) => route.settings.name == expectedRoute.settings.name,
    );
  }
}
