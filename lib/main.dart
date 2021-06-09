import 'package:flutter/material.dart';
import 'package:my_app/app_routes.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      initialRoute: kMainRoute,
      routes: kRoutes,
      onGenerateRoute: (settings) => onGenerateRoute(settings),
    );
  }
}
