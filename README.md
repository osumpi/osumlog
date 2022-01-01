# osumlog

The osum library for logging made with ❤️ by osumpi. Simple and clean
to use.

![image](https://user-images.githubusercontent.com/25143503/147853601-a43a85dc-3194-47c7-ba8a-5ac47e789dd3.png)

## Example Usage

```dart
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
```
