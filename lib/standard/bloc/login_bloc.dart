import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:formz/formz.dart';
import 'package:listwhatever/standard/constants.dart';

import '/standard/authenticationClient/authentication_client.dart';
import '/standard/bloc/login_event.dart';
import '/standard/bloc/login_state.dart';
import '/standard/formsInputs/email.dart';
import '/standard/formsInputs/password.dart';
import '/standard/userRepository/user_repository.dart';
import '/standard/widgets/login_with_email_and_password_form.dart';

class LoginBloc extends Bloc<LoginFormEvent, LoginState> {
  LoginBloc({
    required UserRepository userRepository,
  })  : _userRepository = userRepository,
        super(LoginState(valid: emailText.isNotEmpty)) {
    on<LoginEmailChanged>(_onEmailChanged);
    on<LoginPasswordChanged>(_onPasswordChanged);
    on<EmailAndPasswordSubmitted>(_onEmailAndPasswordSubmitted);
    on<LoginGoogleSubmitted>(_onGoogleSubmitted);
    on<LoginAppleSubmitted>(_onAppleSubmitted);
    on<LoginTwitterSubmitted>(_onTwitterSubmitted);
    on<LoginFacebookSubmitted>(_onFacebookSubmitted);
  }

  static String className = 'LoginBloc';
  final UserRepository _userRepository;

  void _onEmailChanged(LoginEmailChanged event, Emitter<LoginState> emit) {
    final email = Email.dirty(event.email);
    emit(
      state.copyWith(
        email: email,
        valid: Formz.validate([email]),
      ),
    );
  }

  void _onPasswordChanged(
    LoginPasswordChanged event,
    Emitter<LoginState> emit,
  ) {
    final password = Password.dirty(event.password);
    emit(
      state.copyWith(
        password: password,
        valid: Formz.validate([password]),
      ),
    );
  }

  Future<void> _onEmailAndPasswordSubmitted(
    EmailAndPasswordSubmitted event,
    Emitter<LoginState> emit,
  ) async {
    if (!state.valid) return;
    emit(state.copyWith(status: FormzSubmissionStatus.inProgress));
    try {
      await _userRepository.logInWithEmailAndPassword(
        email: state.email.value != '' ? state.email.value : emailText,
        password:
            state.password.value != '' ? state.password.value : passwordText,
      );
      emit(state.copyWith(status: FormzSubmissionStatus.success));
    } catch (error, stackTrace) {
      emit(state.copyWith(status: FormzSubmissionStatus.failure));
      addError(error, stackTrace);
    }
  }

  Future<void> _onGoogleSubmitted(
    LoginGoogleSubmitted event,
    Emitter<LoginState> emit,
  ) async {
    emit(state.copyWith(status: FormzSubmissionStatus.inProgress));
    try {
      logger.i('$className logInWithGoogle');
      await _userRepository.logInWithGoogle();
      logger.i('$className logInWithGoogle done');
      emit(state.copyWith(status: FormzSubmissionStatus.success));
    } on LogInWithGoogleCanceled {
      emit(state.copyWith(status: FormzSubmissionStatus.canceled));
    } catch (error, stackTrace) {
      final errorMessage = switch (error) {
        LogInWithGoogleFailure() => error.extraMessage,
        _ => error.toString()
      };
      emit(
        state.copyWith(
          status: FormzSubmissionStatus.failure,
          errorMessage: errorMessage,
        ),
      );
      addError(error, stackTrace);
    }
  }

  Future<void> _onAppleSubmitted(
    LoginAppleSubmitted event,
    Emitter<LoginState> emit,
  ) async {
    emit(state.copyWith(status: FormzSubmissionStatus.inProgress));
    try {
      await _userRepository.logInWithApple();
      emit(state.copyWith(status: FormzSubmissionStatus.success));
    } catch (error, stackTrace) {
      emit(state.copyWith(status: FormzSubmissionStatus.failure));
      addError(error, stackTrace);
    }
  }

  Future<void> _onTwitterSubmitted(
    LoginTwitterSubmitted event,
    Emitter<LoginState> emit,
  ) async {
    emit(state.copyWith(status: FormzSubmissionStatus.inProgress));
    try {
      await _userRepository.logInWithTwitter();
      emit(state.copyWith(status: FormzSubmissionStatus.success));
    } on LogInWithTwitterCanceled {
      emit(state.copyWith(status: FormzSubmissionStatus.canceled));
    } catch (error, stackTrace) {
      emit(state.copyWith(status: FormzSubmissionStatus.failure));
      addError(error, stackTrace);
    }
  }

  Future<void> _onFacebookSubmitted(
    LoginFacebookSubmitted event,
    Emitter<LoginState> emit,
  ) async {
    emit(state.copyWith(status: FormzSubmissionStatus.inProgress));
    try {
      await _userRepository.logInWithFacebook();
      emit(state.copyWith(status: FormzSubmissionStatus.success));
    } on LogInWithFacebookCanceled {
      emit(state.copyWith(status: FormzSubmissionStatus.canceled));
    } catch (error, stackTrace) {
      emit(state.copyWith(status: FormzSubmissionStatus.failure));
      addError(error, stackTrace);
    }
  }
}
