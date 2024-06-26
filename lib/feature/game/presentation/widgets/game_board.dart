import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:ttt/feature/game/presentation/controllers/game_notifier.dart';
import 'package:ttt/feature/game/presentation/widgets/game_tile.dart';

class GameBoard extends HookConsumerWidget {
  const GameBoard({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final boardState = ref.watch(gameBoardNotifierProvider);

    return Stack(
      alignment: Alignment.center,
      children: [
        IgnorePointer(
          ignoring: !boardState.isGameIntractable,
          child: Opacity(
            opacity: boardState.isGameIntractable ? 1.0 : 0.2,
            child: GridView.builder(
              gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 3,
                crossAxisSpacing: 4.0,
                mainAxisSpacing: 4.0,
              ),
              itemCount: boardState.game.length,
              itemBuilder: (context, index) {
                final box = boardState.game[index];
                return GameTile(
                  box: box,
                  onTap: () {
                    if (box.value != null) return;
                    ref
                        .read(gameBoardNotifierProvider.notifier)
                        .move(index, boardState.currentEntity);
                  },
                );
              },
            ),
          ),
        ),
        Visibility(
          visible: boardState is GameWaitingState,
          child: ElevatedButton(
            onPressed: ref.read(gameBoardNotifierProvider.notifier).startGame,
            child: const Text('Start Game'),
          ),
        ),
        Visibility(
          visible: boardState.hasGameEnded,
          child: ElevatedButton(
            onPressed: ref.read(gameBoardNotifierProvider.notifier).startGame,
            child: const Text('Restart Game'),
          ),
        )
      ],
    );
  }
}
