
import 'package:equatable/equatable.dart';
import 'package:formz/formz.dart';
import '/standard/formsInputs/email.dart';
import '/standard/formsInputs/password.dart';

class LoginState extends Equatable {
  const LoginState({
    this.email = const Email.pure(),
    this.password = const Password.pure(),
    this.status = FormzSubmissionStatus.initial,
    this.valid = false,
    this.errorMessage,
  });

  final Email email;
  final Password password;
  final FormzSubmissionStatus status;
  final bool valid;
  final String? errorMessage;

  @override
  List<Object> get props => [email, password, status, valid];

  LoginState copyWith({
    Email? email,
    Password? password,
    FormzSubmissionStatus? status,
    bool? valid,
    String? errorMessage,
  }) {
    return LoginState(
      email: email ?? this.email,
      password: password ?? this.password,
      status: status ?? this.status,
      valid: valid ?? this.valid,
      errorMessage: errorMessage ?? this.errorMessage,
    );
  }
}
