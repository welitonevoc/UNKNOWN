import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';

class AppWidget extends StatefulWidget {
  const AppWidget({Key? key}) : super(key: key);

  @override
  _AppWidgetState createState() => _AppWidgetState();
}

class _AppWidgetState extends State<AppWidget> {
  @override
  Widget build(BuildContext context) {
    Map<int, Color> color = {
      50: Color.fromRGBO(115, 131, 105, .1),
      100: Color.fromRGBO(115, 131, 105, .2),
      200: Color.fromRGBO(115, 131, 105, .3),
      300: Color.fromRGBO(115, 131, 105, .4),
      400: Color.fromRGBO(115, 131, 105, .5),
      500: Color.fromRGBO(115, 131, 105, .6),
      600: Color.fromRGBO(115, 131, 105, .7),
      700: Color.fromRGBO(115, 131, 105, .8),
      800: Color.fromRGBO(115, 131, 105, .9),
      900: Color.fromRGBO(115, 131, 105, 1),
    };

    ThemeData defaultTheme = ThemeData(
      primarySwatch: MaterialColor(0xFF738369, color),
      primaryColor: Color(0xFF414D37),
      brightness: Brightness.light,
      backgroundColor: Color(0xFFFFFBEF),
      scaffoldBackgroundColor: Color(0xFFFFFBEF),
      iconTheme: IconThemeData(color: Colors.white),
      dividerColor: Colors.white54,
    );

    return MaterialApp.router(
      title: 'MyBible',
      debugShowCheckedModeBanner: false,
      theme: defaultTheme,
      routeInformationParser: Modular.routeInformationParser,
      routerDelegate: Modular.routerDelegate,
    );
  }
}
