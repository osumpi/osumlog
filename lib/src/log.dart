import 'dart:io';

import 'package:osumlog/src/level.dart';
import 'package:osumlog/tint_patched/lib/tint.dart';

class Log {
  factory Log(
    final Object? object, {
    required final LogLevel level,
  }) =>
      Log._(level, null, object);

  Log._(
    final LogLevel level,
    final String? module,
    final Object? object,
  ) {
    if (level.value < Log.loggingLevel.value) return;

    if (level == LogLevels.fatal) stdout.writeCharCode(0x07);

    var logMessage = [
      if (showTimestamp) DateTime.now().toString().dim().reset(),
      if (showLevelSymbolInsteadOfLabel) level.labelAsSymbol else level.label,
      _seperator,
      if (module != null) ...[
        level.moduleNameFormatter(module),
        _seperator,
      ],
      level.messageFormatter(object),
    ].join(' ');

    if (!applyColors) {
      logMessage = logMessage.strip();
    }

    stdout.writeln(logMessage);
  }

  factory Log.fatal(final Object? object) =>
      Log._(LogLevels.fatal, null, object);

  factory Log.error(final Object? object) =>
      Log._(LogLevels.error, null, object);

  factory Log.warn(final Object? object) =>
      Log._(LogLevels.warning, null, object);

  factory Log.info(final Object? object) => Log._(LogLevels.info, null, object);

  factory Log.verbose(final Object? object) =>
      Log._(LogLevels.verbose, null, object);

  factory Log.trace(final Object? object) =>
      Log._(LogLevels.trace, null, object);

  /// The seperator between elements of a log message.
  ///
  /// Obtained by:
  /// ```dart
  /// jsonEncode("•".dim().reset());
  /// ```
  static const _seperator = "\u001b[0m\u001b[2m•\u001b[22m\u001b[0m";

  /// The minimum logging level to be used.
  ///
  /// All log messages with severity equal and above the specified level is
  /// logged to the output.
  ///
  /// Example:
  /// ```dart
  /// Log.loggingLevel = LogLevels.info;
  ///
  /// Log.warn("I'm hungry."); // Works
  /// Log.info("I'm having pizza."); // Works
  /// Log.verbose("I'm breathing hehe."); // Will be ignored
  /// ```
  static LogLevel loggingLevel = LogLevels.info;

  /// Whether to show [LogLevel.labelAsSymbol] instead of [LogLevel.label].
  ///
  /// If `false` (default), shows the descriptive label of the log level.
  /// If `true`, shows the short symbol representation of the log level.
  ///
  /// However, this setting has no affect for [LogLevels.fatal] as this level
  /// is meant to convey very critical faults and hence the descriptive label is
  /// used to prevent confusion.
  static bool showLevelSymbolInsteadOfLabel = false;

  /// Whether to prefix timestamps along with the log message.
  ///
  /// If `false` (default), does not include timestamp in the log message.
  /// If `true`, includes timestamp in the log message.
  static bool showTimestamp = false;

  /// Whether to apply colors when logging based on log level.
  ///
  /// If `true` (default), all ANSI sequences will be preserved when logging.
  /// If `false`, all ANSI sequences will be stripped when logging.
  static bool applyColors = true;
}
