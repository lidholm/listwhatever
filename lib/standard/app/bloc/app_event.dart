import 'package:equatable/equatable.dart';
import 'package:allmylists/standard/userRepository/models/user.dart';

abstract class AppEvent extends Equatable {
  const AppEvent();

  @override
  List<Object> get props => [];
}

class AppLogoutRequested extends AppEvent {
  const AppLogoutRequested();
}

class AppUserChanged extends AppEvent {
  const AppUserChanged(this.user);

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
