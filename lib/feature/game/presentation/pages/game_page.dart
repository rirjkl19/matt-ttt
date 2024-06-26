import 'package:flutter/material.dart';
import 'package:ttt/feature/game/presentation/widgets/game_banner.dart';
import 'package:ttt/feature/game/presentation/widgets/game_board.dart';

class GamePage extends StatelessWidget {
  const GamePage({super.key});

  @override
  Widget build(BuildContext context) {
    final boardWidthSize = MediaQuery.sizeOf(context).width * 0.8;

    return Scaffold(
      appBar: AppBar(
        title: const Text('Tic Tac Toe Game'),
        actions: [
          IconButton(
            onPressed: () {},
            icon: const Icon(Icons.refresh),
          ),
        ],
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const GameBanner(),
          Expanded(
            flex: 3,
            child: Center(
              child: SizedBox(
                width: boardWidthSize,
                child: const GameBoard(),
              ),
            ),
          ),
          Expanded(
            flex: 1,
            child: Center(
              child: ElevatedButton(
                onPressed: () => Navigator.of(context).pop(),
                child: const Text('Back to Home'),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
