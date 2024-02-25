import 'package:listwhatever/standard/app/view/app.dart';

import '/standard/main/bootstrap/bootstrap.dart';
import '/standard/userRepository/user_repository.dart';

void main() {
  bootstrap(
    (
      firebaseMessaging,
      sharedPreferences,
      analyticsRepository,
      authenticationClient,
      userStorage,
    ) async {
      final userRepository = UserRepository(
        authenticationClient: authenticationClient,
        storage: userStorage,
      );

      return App(
        userRepository: userRepository,
        analyticsRepository: analyticsRepository,
        user: await userRepository.user.first,
      );
    },
  );
}
