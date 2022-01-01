import 'package:osumlog/osumlog.dart';
import 'package:osumlog/src/level.dart';

void main() {
  // All log levels with the `Log` constructor.
  for (final level in LogLevels.values) {
    Log('This is $level level log message', level: level);
  }

  // Log.<level>(..) usage.
  Log.error("Error");

  Log.warn("Warning");

  // Put timestamp along with the log message.
  Log.showTimestamp = true;

  Log.fatal("Fatal with timestamps");

  // Use symbols instead of log label flags.
  Log.showLevelSymbolInsteadOfLabel = true;

  Log.warn("Warning with symbol");

  Log.info(Log.loggingLevel.toString().trim());

  // Log level set to output all log messages.
  Log.loggingLevel = LogLevels.all;

  // Ignore colors when logging.
  Log.applyColors = false;

  Log.trace("Fatal but no colors :(");
}
