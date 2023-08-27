import 'package:assessment_project/view/home_screen.dart';
import 'package:flutter/cupertino.dart';
import 'routes_name.dart';

class Routes {
  static Route<dynamic> generateRoute(RouteSettings settings) {
    switch (settings.name) {
      case RoutesName.home:
        return CupertinoPageRoute(
          builder: (context) => const HomeScreen(),
        );
      default:
        return CupertinoPageRoute(
          builder: (context) => const HomeScreen(),
        );
    }
  }
}
