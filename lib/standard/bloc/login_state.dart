
import 'package:equatable/equatable.dart';
import 'package:formz/formz.dart';
import 'package:allmylists/standard/formsInputs/email.dart';
import 'package:allmylists/standard/formsInputs/password.dart';

class LoginState extends Equatable {
  const LoginState({
    this.email = const Email.pure(),
    this.password = const Password.pure(),
    this.status = FormzSubmissionStatus.initial,
    this.valid = false,
  });

  final Email email;
  final Password password;
  final FormzSubmissionStatus status;
  final bool valid;

  @override
  List<Object> get props => [email, password, status, valid];

  LoginState copyWith({
    Email? email,
    Password? password,
    FormzSubmissionStatus? status,
    bool? valid,
  }) {
    return LoginState(
      email: email ?? this.email,
      password: password ?? this.password,
      status: status ?? this.status,
      valid: valid ?? this.valid,
    );
  }
}
