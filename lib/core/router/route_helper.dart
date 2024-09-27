import 'dart:io';
import 'package:animations/animations.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

@immutable
final class RouteHelper {
  static Route<T> _platformSpecificRoute<T>({
    required WidgetBuilder builder,
    required RouteSettings settings,
    required Route<T> Function() materialRoute,
    bool fullscreenDialog = false,
  }) {
    if (Platform.isIOS) {
      return CupertinoPageRoute<T>(
        settings: settings,
        builder: builder,
        fullscreenDialog: fullscreenDialog,
      );
    } else {
      return materialRoute();
    }
  }

  static Route<T> platform<T>({
    required WidgetBuilder builder,
    required RouteSettings settings,
    bool fullscreenDialog = false,
  }) {
    return _platformSpecificRoute(
      builder: builder,
      settings: settings,
      materialRoute: () => MaterialPageRoute<T>(
        settings: settings,
        builder: builder,
        fullscreenDialog: fullscreenDialog,
      ),
      fullscreenDialog: fullscreenDialog,
    );
  }

  static Route<T> material<T>({
    required WidgetBuilder builder,
    required RouteSettings settings,
    bool fullscreenDialog = false,
  }) {
    return _platformSpecificRoute(
      builder: builder,
      settings: settings,
      materialRoute: () => MaterialPageRoute<T>(
        settings: settings,
        builder: builder,
        fullscreenDialog: fullscreenDialog,
      ),
      fullscreenDialog: fullscreenDialog,
    );
  }

  static Route<T> withoutAnimation<T>({
    required WidgetBuilder builder,
    required RouteSettings settings,
    bool fullscreenDialog = false,
  }) {
    return _platformSpecificRoute(
      builder: builder,
      settings: settings,
      materialRoute: () => PageRouteBuilder<T>(
        settings: settings,
        pageBuilder: (context, animation, secondaryAnimation) => builder(context),
        transitionDuration: Duration.zero,
      ),
      fullscreenDialog: fullscreenDialog,
    );
  }

  static Route<T> fade<T>({
    required WidgetBuilder builder,
    required RouteSettings settings,
    bool fullscreenDialog = false,
  }) {
    return _platformSpecificRoute(
      builder: builder,
      settings: settings,
      materialRoute: () => PageRouteBuilder<T>(
        settings: settings,
        pageBuilder: (context, animation, secondaryAnimation) => builder(context),
        transitionsBuilder: (context, animation, secondaryAnimation, child) {
          return FadeTransition(
            opacity: animation,
            child: child,
          );
        },
      ),
      fullscreenDialog: fullscreenDialog,
    );
  }

  static Route<T> slide<T>({
    required WidgetBuilder builder,
    required RouteSettings settings,
    bool fullscreenDialog = false,
  }) {
    return _platformSpecificRoute(
      builder: builder,
      settings: settings,
      materialRoute: () => PageRouteBuilder<T>(
        settings: settings,
        pageBuilder: (context, animation, secondaryAnimation) => builder(context),
        transitionsBuilder: (context, animation, secondaryAnimation, child) {
          const begin = Offset(1, 0);
          const end = Offset.zero;
          final tween = Tween(begin: begin, end: end);
          final offsetAnimation = animation.drive(tween);
          return SlideTransition(
            position: offsetAnimation,
            child: child,
          );
        },
      ),
      fullscreenDialog: fullscreenDialog,
    );
  }

  // slide up
  static Route<T> slideUp<T>({
    required WidgetBuilder builder,
    required RouteSettings settings,
    bool fullscreenDialog = false,
  }) {
    return PageRouteBuilder<T>(
      settings: settings,
      pageBuilder: (context, animation, secondaryAnimation) => builder(context),
      transitionsBuilder: (context, animation, secondaryAnimation, child) {
        const begin = Offset(0, 1);
        const end = Offset.zero;
        final tween = Tween(begin: begin, end: end);
        final offsetAnimation = animation.drive(tween);
        return SlideTransition(
          position: offsetAnimation,
          child: child,
        );
      },
    );
  }

  static Route<T> fadeThrough<T>({
    required WidgetBuilder builder,
    required RouteSettings settings,
    bool fullscreenDialog = false,
  }) {
    return _platformSpecificRoute(
      builder: builder,
      settings: settings,
      materialRoute: () => PageRouteBuilder<T>(
        settings: settings,
        pageBuilder: (context, animation, secondaryAnimation) => builder(context),
        transitionsBuilder: (context, animation, secondaryAnimation, child) {
          return FadeThroughTransition(
            animation: animation,
            secondaryAnimation: secondaryAnimation,
            child: child,
          );
        },
      ),
      fullscreenDialog: fullscreenDialog,
    );
  }

  static Route<T> heroThrough<T>({
    required WidgetBuilder builder,
    required RouteSettings settings,
    bool fullscreenDialog = false,
  }) {
    return _platformSpecificRoute(
      builder: builder,
      settings: settings,
      materialRoute: () => PageRouteBuilder<T>(
        settings: settings,
        opaque: false,
        transitionDuration: const Duration(milliseconds: 500),
        reverseTransitionDuration: const Duration(milliseconds: 700),
        pageBuilder: (context, animation, secondaryAnimation) => builder(context),
        transitionsBuilder: (context, animation, secondaryAnimation, child) {
          return FadeThroughTransition(
            animation: animation,
            secondaryAnimation: secondaryAnimation,
            child: child,
          );
        },
      ),
      fullscreenDialog: fullscreenDialog,
    );
  }

  static Route<T> fadeScale<T>({
    required WidgetBuilder builder,
    required RouteSettings settings,
    bool fullscreenDialog = false,
  }) {
    return _platformSpecificRoute(
      builder: builder,
      settings: settings,
      materialRoute: () => PageRouteBuilder<T>(
        settings: settings,
        pageBuilder: (context, animation, secondaryAnimation) => builder(context),
        transitionsBuilder: (context, animation, secondaryAnimation, child) {
          return FadeScaleTransition(
            animation: animation,
            child: child,
          );
        },
      ),
      fullscreenDialog: fullscreenDialog,
    );
  }

  static Route<T> fadeInOut<T>({
    required WidgetBuilder builder,
    required RouteSettings settings,
    bool fullscreenDialog = false,
  }) {
    return _platformSpecificRoute(
      builder: builder,
      settings: settings,
      materialRoute: () => PageRouteBuilder<T>(
        pageBuilder: (context, animation, secondaryAnimation) => builder(context),
        transitionDuration: const Duration(milliseconds: 500),
        reverseTransitionDuration: const Duration(milliseconds: 500),
        transitionsBuilder: (context, animation, secondaryAnimation, child) {
          const begin = Offset(0.0, 2.0);
          const end = Offset.zero;
          const curve = Curves.easeInOut;

          final tween = Tween(begin: begin, end: end).chain(CurveTween(curve: curve));

          final offsetAnimation = animation.drive(tween);

          return FadeTransition(
            opacity: animation,
            child: SlideTransition(
              position: offsetAnimation,
              child: child,
            ),
          );
        },
      ),
      fullscreenDialog: fullscreenDialog,
    );
  }

  static Route<T> hero<T>({
    required WidgetBuilder builder,
    required RouteSettings settings,
    bool fullscreenDialog = false,
  }) {
    return _platformSpecificRoute(
      builder: builder,
      settings: settings,
      materialRoute: () => PageRouteBuilder<T>(
        pageBuilder: (context, animation, secondaryAnimation) => builder(context),
        transitionDuration: const Duration(milliseconds: 1000),
        reverseTransitionDuration: const Duration(milliseconds: 1000),
        transitionsBuilder: (
          BuildContext context,
          Animation<double> animation,
          Animation<double> secondaryAnimation,
          Widget child,
        ) {
          const begin = Offset(0.0, 2.0);
          const end = Offset.zero;
          const curve = Curves.easeInOut;

          final tween = Tween(begin: begin, end: end).chain(CurveTween(curve: curve));

          final offsetAnimation = animation.drive(tween);
          return FadeTransition(
            opacity: animation,
            child: SlideTransition(
              position: offsetAnimation,
              child: child,
            ),
          );
        },
      ),
      fullscreenDialog: fullscreenDialog,
    );
  }

  static Route<T> sharedAxis<T>({
    required WidgetBuilder builder,
    required RouteSettings settings,
    SharedAxisTransitionType type = SharedAxisTransitionType.scaled,
    bool fullscreenDialog = false,
  }) {
    return _platformSpecificRoute(
      builder: builder,
      settings: settings,
      materialRoute: () => PageRouteBuilder<T>(
        settings: settings,
        pageBuilder: (context, animation, secondaryAnimation) => builder(context),
        transitionsBuilder: (context, animation, secondaryAnimation, child) {
          return SharedAxisTransition(
            animation: animation,
            secondaryAnimation: secondaryAnimation,
            transitionType: type,
            child: child,
          );
        },
      ),
      fullscreenDialog: fullscreenDialog,
    );
  }

  static Route<T> dialog<T>({
    required BuildContext context,
    required WidgetBuilder builder,
    required RouteSettings settings,
    CapturedThemes? themes,
    Color? barrierColor = Colors.black54,
    bool barrierDismissible = true,
    String? barrierLabel,
    bool useSafeArea = false,
  }) {
    return _platformSpecificRoute(
      builder: builder,
      settings: settings,
      materialRoute: () => DialogRoute<T>(
        context: context,
        builder: builder,
        themes: themes,
        barrierColor: barrierColor,
        barrierDismissible: barrierDismissible,
        barrierLabel: barrierLabel,
        settings: settings,
        useSafeArea: useSafeArea,
      ),
      fullscreenDialog: false,
    );
  }
}
