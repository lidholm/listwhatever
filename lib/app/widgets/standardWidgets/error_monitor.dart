import 'package:firebase_crashlytics/firebase_crashlytics.dart';
import 'package:flutter/material.dart';
import 'package:listanything/app/helpers/constants.dart';

class ErrorMonitor {
  const ErrorMonitor({required this.crashlytics, required this.webReporter});

  ErrorMonitor.web() : this(crashlytics: null, webReporter: 'todo');

  ErrorMonitor.device()
      : this(crashlytics: FirebaseCrashlytics.instance, webReporter: 'todo');

  final FirebaseCrashlytics? crashlytics;
  final String? webReporter;

  Future<void> recordError(dynamic e, StackTrace? s, String reason) async {
    if (crashlytics != null) {
      logger.d('got error $e $s');
      await crashlytics!.recordError(e, s, reason: reason);
    } else {
      // ignore: avoid_print
      logger.d('got error $e $s');
    }
  }

  Future<void> recordFlutterError(FlutterErrorDetails e) async {
    if (crashlytics != null) {
      logger.d('got recordFlutterError $e');
      await crashlytics!.recordFlutterError(e);
    } else {
      // ignore: avoid_print
      logger.d('got recordFlutterError $e');
    }
  }

  Future<void> recordFlutterFatalError(FlutterErrorDetails e) async {
    if (crashlytics != null) {
      logger.d('got FlutterErrorDetails $e');
      await crashlytics!.recordFlutterFatalError(e);
    } else {
      // ignore: avoid_print
      logger.d('got FlutterErrorDetails $e');
    }
  }
}
