import 'package:flutter_bloc/flutter_bloc.dart';
import '/standard/constants.dart';

class RedirectCubit extends Cubit<String?> {
  RedirectCubit() : super(null);
  static String className = 'RedirectCubit';

  void setRedirect(String uri) {
    logger.d('$className.setting redirect to $uri');
    emit(uri);
  }

  void clear() {
    logger.d('$className.clearing redirect');
    emit(null);
  }
}
