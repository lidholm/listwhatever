import 'package:equatable/equatable.dart';
import 'package:listwhatever/standard/constants.dart';
import '/standard/settings/settings.dart';
import '/standard/userRepository/models/user.dart';

abstract class AppEvent extends Equatable {
  const AppEvent();

  @override
  List<Object> get props => [];
}

class AppLogoutRequested extends AppEvent {
  const AppLogoutRequested();
}

class AppUserChanged extends AppEvent {
  AppUserChanged(this.user) {
    logger.i('$this => creating AppUserChanged with $user QQQ');
  }

  final User user;

  @override
  List<Object> get props => [user];
}

class AppOnboardingCompleted extends AppEvent {
  const AppOnboardingCompleted();
}

class AppOpened extends AppEvent {
  const AppOpened();
}

class UpdateSettings extends AppEvent {
  const UpdateSettings(this.user, this.settings);

  final User user;
  final Settings settings;

  @override
  List<Object> get props => [user];
}
