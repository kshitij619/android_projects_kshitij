import 'dart:math' as math;

class PixelArtData {
  static List<String> drawing = List.generate(24 * 24, (index) {
    return math.Random().nextInt(0xffffffff).toString();
  });
}
