import 'package:flutter/material.dart';
import 'package:ttt/core/routes/app_routes.dart';

// Tic Tac Toe App for CoDev 🤣
class TttApp extends StatelessWidget {
  const TttApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      title: 'Matt TTT',
      initialRoute: AppRoutes.home,
      onGenerateRoute: AppRoutes.onGenerateRoute,
    );
  }
}
