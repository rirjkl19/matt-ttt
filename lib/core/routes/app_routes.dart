import 'package:flutter/material.dart';
import 'package:ttt/feature/game/presentation/pages/game_page.dart';

final class AppRoutes {
  static const String root = '/';

  static Route<dynamic> onGenerateRoute(RouteSettings settings) {
    switch (settings.name) {
      case root:
        return MaterialPageRoute(builder: (_) => const GamePage());
      default:
        return MaterialPageRoute(builder: (_) => const GamePage());
    }
  }
}
