enum GameEntity {
  system(''),
  player1('❌'),
  player2('⭕️');

  final String value;

  const GameEntity(this.value);

  GameEntity get opponent {
    if (this == player1) return player2;
    if (this == player2) return player1;
    return system;
  }
}
