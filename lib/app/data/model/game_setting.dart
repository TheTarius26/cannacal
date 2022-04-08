class GameSetting {
  String title;
  int lives;
  int matrix;
  int point;
  int duration;

  GameSetting({
    this.title = '',
    this.lives = 0,
    this.matrix = 0,
    this.point = 0,
    this.duration = 0,
  });

  factory GameSetting.veryEasy() => GameSetting(
        title: 'Very Easy',
        lives: 0,
        matrix: 2,
        point: 10,
        duration: 5,
      );

  factory GameSetting.easy() => GameSetting(
        title: 'Easy',
        lives: 5,
        matrix: 3,
        point: 100,
        duration: 180,
      );

  factory GameSetting.medium() => GameSetting(
        title: 'Medium',
        lives: 3,
        matrix: 4,
        point: 500,
        duration: 120,
      );

  factory GameSetting.hard() => GameSetting(
        title: 'Hard',
        lives: 3,
        matrix: 5,
        point: 1000,
        duration: 300,
      );

  static List<GameSetting> getListGameSetting() {
    return [
      GameSetting.veryEasy(),
      GameSetting.easy(),
      GameSetting.medium(),
      GameSetting.hard(),
    ];
  }
}
