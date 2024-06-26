import 'package:flutter/widgets.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:ttt/feature/game/domain/models/game_entity.dart';
import 'package:ttt/feature/game/presentation/controllers/game_notifier.dart';

class GameBanner extends ConsumerWidget {
  const GameBanner({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final gameState = ref.watch(gameBoardNotifierProvider);

    final bannerLabel = switch (gameState.currentEntity) {
      GameEntity.system => gameState.hasGameEnded ? 'Tie' : 'Waiting...',
      GameEntity.player1 => gameState.hasGameEnded ? 'Player 1 won!' : 'Player 1\'s turn',
      GameEntity.player2 => gameState.hasGameEnded ? 'Player 2 won!' : 'Player 2\'s turn',
    };

    return Center(
      child: Text(
        bannerLabel,
        style: const TextStyle(
          fontSize: 34,
          fontWeight: FontWeight.bold,
        ),
      ),
    );
  }
}
