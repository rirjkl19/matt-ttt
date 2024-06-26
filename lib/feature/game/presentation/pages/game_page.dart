import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:ttt/feature/game/presentation/controllers/game_notifier.dart';
import 'package:ttt/feature/game/presentation/widgets/game_banner.dart';
import 'package:ttt/feature/game/presentation/widgets/game_board.dart';

class GamePage extends HookConsumerWidget {
  const GamePage({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final boardWidthSize = useMemoized(() => MediaQuery.sizeOf(context).width * 0.8);

    return Scaffold(
      appBar: AppBar(
        title: const Text('Tic Tac Toe Game'),
        actions: [
          IconButton(
            onPressed: () {
              ref.read(gameBoardNotifierProvider.notifier).startGame();
            },
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
