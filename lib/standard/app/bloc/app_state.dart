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

// class AppState extends Equatable {
//   const AppState({
//     required this.status,
//     this.user = anonymousUser,
//     this.showLoginOverlay = false,
//   });

//   const AppState.loggedIn(
//     User user,
//   ) : this(
//           status: AppStatus.loggedIn,
//           user: user,
//         );

//   const AppState.loggedInWithData(User user)
//       : this(
//           status: AppStatus.loggedInWithData,
//           user: user,
//         );

//   const AppState.onboardingRequired(User user)
//       : this(
//           status: AppStatus.loggedInWithData,
//           user: user,
//         );

//   const AppState.onboarded(User user)
//       : this(
//           status: AppStatus.onboarded,
//           user: user,
//         );

//   const AppState.loggedOut() : this(status: AppStatus.loggedOut);

//   final AppStatus status;
//   final User user;
//   final bool showLoginOverlay;

//   @override
//   List<Object?> get props => [
//         status,
//         user,
//         showLoginOverlay,
//       ];

//   AppState copyWith({
//     AppStatus? status,
//     User? user,
//     bool? showLoginOverlay,
//   }) {
//     return AppState(
//       status: status ?? this.status,
//       user: user ?? this.user,
//       showLoginOverlay: showLoginOverlay ?? this.showLoginOverlay,
//     );
//   }
// }
