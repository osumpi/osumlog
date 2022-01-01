import 'package:osumlog/osumlog.dart';
import 'package:osumlog/src/level.dart';

void main() {
  for (final level in LogLevels.values) {
    Log('This is $level level log message', level: level);
  }
}
