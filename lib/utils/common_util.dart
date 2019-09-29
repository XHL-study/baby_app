import 'dart:math';

class CommonUtil {
  static int randomInt(int max) {
    return Random().nextInt(max ?? 0);
  }

  static double randomDouble(int len) {
    return double.parse(Random().nextDouble().toStringAsFixed(len));
  }
}
