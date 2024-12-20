import 'package:logger/logger.dart';

class LoggerHelper {
  static Logger logger = Logger(
    // printer: PrettyPrinter(methodCount: 0, printTime: true),
    printer: SimplePrinter(printTime: true),
    level: Level.debug,
    output: PrintLogOutput(),
    filter: ProductionFilter(),
  );
}

class PrintLogOutput extends LogOutput {
  @override
  void output(OutputEvent event) {
    for (final line in event.lines) {
      print(line);
    }
  }
}
