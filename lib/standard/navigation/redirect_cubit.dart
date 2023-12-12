
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:listanything/standard/constants.dart';


class RedirectCubit extends Cubit<String?> {
  RedirectCubit() : super(null);

  void setRedirect(String uri) {
    logger.d('$this.setting redirect to $uri');
    emit(uri);
  }

  void clear() {
    logger.d('$this.clearing redirect');
    emit(null);
  }
}
