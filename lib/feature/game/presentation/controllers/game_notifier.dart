import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:ttt/feature/game/domain/models/game_box.dart';
import 'package:ttt/feature/game/domain/models/game_entity.dart';

final gameBoardNotifierProvider =
    NotifierProvider.autoDispose<GameBoardNotifier, GameState>(GameBoardNotifier.new);

class GameBoardNotifier extends AutoDisposeNotifier<GameState> {
  @override
  GameState build() => GameWaitingState();

  void startGame() {
    state = GamePlayingState(
      game: List.generate(9, (index) => GameBox(index: index)),
      currentEntity: GameEntity.player1,
    );
  }

  void move(int index, GameEntity entity) {
    final box = state.game[index];
    final newBox = GameBox(index: box.index, value: entity.value);
    final newBoxes = List<GameBox>.from(state.game)..[index] = newBox;

    state = GamePlayingState(
      game: newBoxes,
      currentEntity: entity.opponent,
    );

    if (_checkWin(entity)) {
      state = GameEndState(game: newBoxes, currentEntity: entity);
    } else if (state.isBoxesFilled) {
      state = GameEndState(game: newBoxes, currentEntity: GameEntity.system);
    }
  }

  bool _checkWin(GameEntity entity) {
    final winPatterns = [
      [0, 1, 2],
      [3, 4, 5],
      [6, 7, 8],
      [0, 3, 6],
      [1, 4, 7],
      [2, 5, 8],
      [0, 4, 8],
      [2, 4, 6],
    ];

    return winPatterns.any((pattern) {
      final values = pattern.map((index) => state.game[index].value);
      return values.every((value) => value == entity.value);
    });
  }
}

sealed class GameState {
  final List<GameBox> game;
  final GameEntity currentEntity;
  bool get isBoxesFilled => game.every((box) => box.value != null);
  bool get isGameIntractable => this is GamePlayingState;
  bool get hasGameEnded => this is GameEndState;

  const GameState({this.game = const [], this.currentEntity = GameEntity.system});
}

class GameWaitingState extends GameState {
  GameWaitingState({super.game, super.currentEntity});
}

class GamePlayingState extends GameState {
  GamePlayingState({super.game, super.currentEntity});
}

class GameEndState extends GameState {
  GameEndState({super.game, super.currentEntity});
}
