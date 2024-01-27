class Color {
  final int r;
  final int g;
  final int b;

  const Color(this.r, this.g, this.b);

  Color.of({
    required this.r,
    required this.g,
    required this.b,
  });
}

class Colors {
  Colors._();

  static const white = Color(255, 255, 255);
  static const warmWhite = Color(255, 224, 160);
  static const orange = Color(255, 160, 0);
  static const yellow = Color(255, 200, 0);

  static const red = Color(255, 0, 0);
  static const green = Color(0, 255, 0);
  static const blue = Color(0, 0, 255);
}
