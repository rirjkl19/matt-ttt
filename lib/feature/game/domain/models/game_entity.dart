/// Game entities that represent the players and the system
enum GameEntity {
  system(''),
  player1('❌'),
  player2('⭕️');

  /// The value of the entity in the game board
  final String value;

  const GameEntity(this.value);

  /// Get the opponent of the entity
  GameEntity get opponent {
    if (this == player1) return player2;
    if (this == player2) return player1;
    return system;
  }
}
