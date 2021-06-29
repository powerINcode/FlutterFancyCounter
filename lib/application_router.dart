import 'package:counter_app/feature_counter/ui/counter_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

class ApplicationRouter {
  static const _homeRoute = '/';

  String get initialRoute => _homeRoute;

  Route<dynamic> generateRoutes(RouteSettings settings) {
    switch(settings.name) {
      case _homeRoute:
          return MaterialPageRoute(builder: (_) => CounterScreen());
      default: throw Exception('Incorrect route');
    }
  }
}