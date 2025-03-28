import 'package:flutter/material.dart';
import 'package:lyra/about/home_about.dart';
import 'package:lyra/gla/home_gla.dart';
import 'package:lyra/lesson/home_lesson.dart';
import 'package:lyra/rdb/home_rdb.dart';

class TabNavigatorRoutes {
  static const String root = "/";
  static const String detail = "/detail";
}

class TabNavigator extends StatelessWidget {
  // ignore: use_key_in_widget_constructors
  const TabNavigator({required this.navigatorKey, required this.tabItem});
  final GlobalKey<NavigatorState> navigatorKey;
  final String tabItem;

  @override
  Widget build(BuildContext context) {
    Widget child;
    if (tabItem == "rdb") {
      child = const RdbPage();
    } else if (tabItem == "gla") {
      child = const GlaPage();
    } else if (tabItem == "lesson") {
      child = const LessonHome();
    } else {
      child = const AboutHome();
    }

    return Navigator(
      key: navigatorKey,
      onGenerateRoute: (routeSettings) {
        return MaterialPageRoute(builder: (context) => child);
      },
    );
  }
}
