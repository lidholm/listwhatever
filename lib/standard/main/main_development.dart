import 'package:listwhatever/standard/helpers/logger_helper.dart';

import '/standard/main/bootstrap/bootstrap.dart';

void main() {
  LoggerHelper.logger.i('Starting in development mode');
  bootstrap();
}
