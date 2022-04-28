class Difficulty {
  String title;
  int lives;
  int matrix;
  int point;
  int duration;
  int highScore;

  Difficulty({
    this.title = '',
    this.lives = 0,
    this.matrix = 0,
    this.point = 0,
    this.duration = 0,
    this.highScore = 0,
  });

  factory Difficulty.veryEasy({int highScore = 0}) => Difficulty(
        title: 'Very Easy',
        lives: 0,
        matrix: 2,
        point: 10,
        duration: 5,
        highScore: highScore,
      );

  factory Difficulty.easy({int highScore = 0}) => Difficulty(
        title: 'Easy',
        lives: 5,
        matrix: 3,
        point: 100,
        duration: 180,
        highScore: highScore,
      );

  factory Difficulty.medium({int highScore = 0}) => Difficulty(
        title: 'Medium',
        lives: 3,
        matrix: 4,
        point: 500,
        duration: 120,
        highScore: highScore,
      );

  factory Difficulty.hard({int highScore = 0}) => Difficulty(
        title: 'Hard',
        lives: 3,
        matrix: 5,
        point: 1000,
        duration: 300,
        highScore: highScore,
      );
}
