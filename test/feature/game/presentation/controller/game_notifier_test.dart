import 'package:flutter_test/flutter_test.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:ttt/feature/game/domain/models/game_entity.dart';

import 'package:ttt/feature/game/presentation/controllers/game_notifier.dart';

void main() {
  late ProviderContainer container;
  late GameBoardNotifier notifier;

  setUp(() {
    container = ProviderContainer();
    notifier = container.read(gameBoardNotifierProvider.notifier);
  });

  tearDown(container.dispose);

  test('Game starts correctly', () {
    notifier.startGame();
    final state = container.read(gameBoardNotifierProvider);

    expect(state is GamePlayingState, true);
    expect(state.game.length, 9);
    expect(state.currentEntity, GameEntity.player1);
  });

  test('Move updates state correctly', () {
    notifier.startGame();
    notifier.move(0, GameEntity.player1);

    final state = container.read(gameBoardNotifierProvider);
    expect(state.game[0].value, '❌');
    expect(state.currentEntity, GameEntity.player2);
  });

  test('Detects win correctly', () {
    notifier.startGame();
    notifier.move(0, GameEntity.player1);
    notifier.move(3, GameEntity.player2);
    notifier.move(1, GameEntity.player1);
    notifier.move(4, GameEntity.player2);
    notifier.move(2, GameEntity.player1); // Winning move

    final state = container.read(gameBoardNotifierProvider);
    expect(state is GameEndState, true);
    expect(state.currentEntity, GameEntity.player1);
  });

  test('Detects draw correctly', () {
    notifier.startGame();
    notifier.move(0, GameEntity.player1);
    notifier.move(1, GameEntity.player2);
    notifier.move(2, GameEntity.player1);
    notifier.move(4, GameEntity.player2);
    notifier.move(3, GameEntity.player1);
    notifier.move(5, GameEntity.player2);
    notifier.move(7, GameEntity.player1);
    notifier.move(6, GameEntity.player2);
    notifier.move(8, GameEntity.player1); // Last move, no winner

    final state = container.read(gameBoardNotifierProvider);
    expect(state is GameEndState, true);
    expect(state.currentEntity, GameEntity.system);
  });
}
