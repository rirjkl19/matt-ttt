import 'package:flutter/material.dart';
import 'package:ttt/feature/game/domain/models/game_box.dart';

class GameTile extends StatelessWidget {
  const GameTile({super.key, required this.box, required this.onTap});

  final GameBox box;
  final VoidCallback onTap;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap.call,
      child: Container(
        decoration: BoxDecoration(
          color: Colors.transparent,
          border: Border.all(color: Colors.black),
        ),
        child: Center(
          child: Text(
            box.value ?? '',
            style: const TextStyle(fontSize: 32, fontWeight: FontWeight.bold),
          ),
        ),
      ),
    );
  }
}
