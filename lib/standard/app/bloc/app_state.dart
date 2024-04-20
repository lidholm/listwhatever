import 'package:freezed_annotation/freezed_annotation.dart';

import '/standard/userRepository/models/user.dart';

part 'app_state.freezed.dart';

@freezed
sealed class AppState with _$AppState {
  factory AppState.loggedIn(User user) = LoggedIn;
  factory AppState.loggedInWithData(User user) = LoggedInWithData;
  factory AppState.onboardingRequired(User user) = OnboardingRequired;
  factory AppState.loggedOut() = LoggedOut;
}
