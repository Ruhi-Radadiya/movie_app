import 'package:flutter/material.dart';
import 'package:movie_app/routes/routes.dart';
import 'package:provider/provider.dart';

import '../controller/moviecontroller.dart';
import '../controller/savecontroller.dart';

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(
          create: (context) => Moviecontroller(),
        ),
        ChangeNotifierProvider(
          create: (context) => Savecontroller(),
        ),
      ],
      builder: (context, child) => child!,
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        routes: Routes.myRoutes,
      ),
    );
  }
}
