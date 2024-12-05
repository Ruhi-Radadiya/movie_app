import 'package:flutter/material.dart';
import 'package:movie_app/screen/savepage.dart';

import '../screen/detail.dart';
import '../screen/home_page.dart';
import '../screen/splash.dart';

class Routes {
  static const splash = '/';
  static const home = '/home';
  static const detail = '/detail';
  static const save = '/save';

  static Map<String, WidgetBuilder> myRoutes = {
    splash: (context) => const SplashScreen(),
    home: (context) => const HomePage(),
    detail: (context) => const DetailPage(),
    save: (context) => const Savepage(),
  };
}
