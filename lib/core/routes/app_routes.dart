import 'package:flutter/material.dart';
import 'package:ttt/core/widgets/invalid_page.dart';
import 'package:ttt/feature/auth/presentation/pages/auth_page.dart';
import 'package:ttt/feature/game/presentation/pages/game_page.dart';
import 'package:ttt/feature/home/presentation/pages/home_page.dart';

final class AppRoutes {
  static const String auth = '/auth';
  static const String game = '/game';
  static const String home = '/home';

  static Route<dynamic> onGenerateRoute(RouteSettings settings) {
    switch (settings.name) {
      case auth:
        return MaterialPageRoute(builder: (_) => const AuthPage());
      case game:
        return MaterialPageRoute(builder: (_) => const GamePage());
      case home:
        return MaterialPageRoute(builder: (_) => const HomePage());
      default:
        return MaterialPageRoute(builder: (_) => const InvalidPage());
    }
  }
}
