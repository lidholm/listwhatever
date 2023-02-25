// import 'package:firebase_crashlytics/firebase_crashlytics.dart';

class ErrorMonitor {
  const ErrorMonitor({required this.crashlytics, required this.webReporter});

  ErrorMonitor.web() : this(crashlytics: null, webReporter: 'todo');

  // ErrorMonitor.device(FirebaseCrashlytics c) : this(crashlytics: c, webReporter: 'todo');
  ErrorMonitor.device() : this(crashlytics: null, webReporter: 'todo');

  // final FirebaseCrashlytics? crashlytics;
  final String? crashlytics;
  final String? webReporter;

  Future<void> recordError(dynamic e, StackTrace? s, String reason) async {
    if (crashlytics != null) {
      // await crashlytics!.recordError(e, s, reason: reason);
    } else {
      // ignore: avoid_print
      print('got error $e $s');
    }
  }
}
