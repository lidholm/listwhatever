import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:listwhatever/standard/helpers/logger_helper.dart';

class RedirectCubit extends Cubit<String?> {
  RedirectCubit() : super(null);
  static String className = 'RedirectCubit';

  void setRedirect(String uri) {
    LoggerHelper.logger.d('$className.setting redirect to $uri');
    emit(uri);
  }

  void clear() {
    LoggerHelper.logger.d('$className.clearing redirect');
    emit(null);
  }
}
