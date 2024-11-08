import 'package:flutter_bloc/flutter_bloc.dart';

class RedirectCubit extends Cubit<String?> {
  RedirectCubit() : super(null);
  static String className = 'RedirectCubit';

  void setRedirect(String uri) {
    emit(uri);
  }

  void clear() {
    emit(null);
  }
}
