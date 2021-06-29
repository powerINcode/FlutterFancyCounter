import 'package:counter_app/app_theme.dart';
import 'package:counter_app/application_router.dart';
import 'package:counter_app/di/application_module.dart';
import 'package:flutter/material.dart';
import 'package:sizer/sizer.dart';

void main() {
  ApplicationModule.init();
  runApp(
      CounterApp(
          router: ApplicationModule.get(), theme: ApplicationModule.get()));
}

class CounterApp extends StatelessWidget {
  // This widget is the root of your application.
  final ApplicationRouter router;
  final ApplicationTheme theme;

  const CounterApp({Key? key, required this.router, required this.theme})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Sizer(
        builder: (context, orientation, deviceType) {
          return MaterialApp(
              title: 'Fancy counter',
              initialRoute: router.initialRoute,
              onGenerateRoute: router.generateRoutes,
              theme: theme.lightTheme,
              darkTheme: theme.darkTheme);
        }
    );
  }
}
