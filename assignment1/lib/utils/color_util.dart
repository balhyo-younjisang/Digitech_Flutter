import 'dart:math';
import 'dart:ui';

var _random = Random();

class ColorUtil {
  static Color random() => randomWithRange();

  static Color randomWithRange({
    final int min = 0,
    final int max = 255
  }) {
    if (max < min) {
      throw ArgumentError('매개변수 \'max\'은 매개변수 \'min\' 보다 작을 수 없습니다.');
    }
    if (max < 0 || max > 255) {
      throw ArgumentError('매개변수 \'max\'는 0보다 크고, 255보다 작거나 같아야 합니다.');
    }
    if (min < 0 || min > 255) {
      throw ArgumentError('매개변수 \'min\'은 0보다 크고, 255보다 작거나 같아야 합니다.');
    }

    final range = max - min;

    return Color.fromRGBO(
        _random.nextInt(range) + min,
        _random.nextInt(range) + min,
        _random.nextInt(range) + min,
        1
    );
  }
}