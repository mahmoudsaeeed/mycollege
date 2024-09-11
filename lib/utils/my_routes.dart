import 'package:flutter/material.dart';

import '../presentation/views/home_view.dart';
import '../presentation/views/my_table_view.dart';
import 'constant.dart';

class Routes {
  Route<dynamic>? Function(RouteSettings settings)? myRoutes = (settings) {
    switch (settings.name) {
      case homeView:
        return MaterialPageRoute(
          builder: (context) => const HomeView(),
        );

      case myTableView:
        return MaterialPageRoute(
          builder: (context) => const MyTableView(),
        );
    }
    return null;
  };
}
