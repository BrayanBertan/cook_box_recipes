import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:responsive_framework/responsive_framework.dart';
import 'package:responsive_framework/responsive_wrapper.dart';

class AppWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primaryColor: Color.fromRGBO(203, 100, 100, 1),
        fontFamily: 'happymonkey',
      ),
      builder: (context, widget) => ResponsiveWrapper.builder(
          ClampingScrollWrapper.builder(context, widget),
          minWidth: 480,
          defaultName: MOBILE,
          defaultScale: true,
          breakpoints: [
            ResponsiveBreakpoint.autoScale(450, name: MOBILE),
            ResponsiveBreakpoint.autoScale(700, name: TABLET),
            ResponsiveBreakpoint.resize(800, name: DESKTOP),
          ]),
      initialRoute: "/",
    ).modular();
  }
}
