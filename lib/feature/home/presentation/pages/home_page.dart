import 'package:flutter/material.dart';
import 'package:ttt/core/routes/app_routes.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Home Page'),
      ),
      body: Center(
        child: ElevatedButton(
          onPressed: () {
            Navigator.of(context).pushNamed(AppRoutes.game);
          },
          child: const Text('Start Game'),
        ),
      ),
    );
  }
}
