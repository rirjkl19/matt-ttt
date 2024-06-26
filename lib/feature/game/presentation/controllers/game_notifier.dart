import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:ttt/feature/game/domain/models/game_box.dart';
import 'package:ttt/feature/game/domain/models/game_entity.dart';

final gameBoardNotifierProvider =
    NotifierProvider.autoDispose<GameBoardNotifier, GameState>(GameBoardNotifier.new);

class GameBoardNotifier extends AutoDisposeNotifier<GameState> {
  @override
  GameState build() => GameWaitingState();

  void startGame() {
    state = GameStartState(
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
  }
}

sealed class GameState {
  final List<GameBox> game;
  final GameEntity currentEntity;
  bool get isGameFinished => game.every((box) => box.value != null);
  bool get isGameIntractable => this is GameStartState || this is GamePlayingState;

  GameState({
    this.game = const [],
    this.currentEntity = GameEntity.system,
  });
}

class GameWaitingState extends GameState {
  GameWaitingState({super.game, super.currentEntity});
}

class GameStartState extends GameState {
  GameStartState({super.game, super.currentEntity});
}

class GamePlayingState extends GameState {
  GamePlayingState({super.game, super.currentEntity});
}

class GameEndState extends GameState {
  GameEndState({super.game, super.currentEntity});
}
