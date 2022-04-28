class User {
  int highScore;

  User({
    required this.highScore,
  });

  User copyWith({
    String? name,
    int? highScore,
  }) =>
      User(
        highScore: highScore ?? this.highScore,
      );
}
