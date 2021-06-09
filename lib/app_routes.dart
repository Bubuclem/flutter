import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:my_app/app/screens/history-details/history_details_screen.dart';
import 'package:my_app/app/screens/history/history_screen.dart';
import 'package:my_app/app/screens/home/home_screen.dart';
import 'package:my_app/app/screens/login/login_screen.dart';
import 'package:my_app/app/screens/scan/scan_screen.dart';
import 'package:my_app/app/screens/splash/splash_screen.dart';

import 'app/modules/history/model/history_model.dart';

const kMainRoute = '/';
const kHomeRoute = '/home';
const kLoginRoute = '/login';
const kHistoryRoute = '/history';
const kHistoryDetailsRoute = '/history-details';
const kScanRoute = '/scan';

final Map<String, WidgetBuilder> kRoutes = {
  kMainRoute: (_) => SplashScreen(),
  kHomeRoute: (_) => HomeScreen(),
  kLoginRoute: (_) => LoginScreen(),
  kHistoryRoute: (_) => HistoryScreen(),
  kScanRoute: (_) => ScanScreen(),
};

onGenerateRoute(settings) {
  if (settings.name == kHistoryDetailsRoute) {
    History data = settings.arguments;
    return MaterialPageRoute(builder: (_) => HistoryDetailsScreen(data: data));
  } else if (settings.name != null) {
    return MaterialPageRoute(builder: kRoutes[settings.name]!);
  } else {
    return null;
  }
}
