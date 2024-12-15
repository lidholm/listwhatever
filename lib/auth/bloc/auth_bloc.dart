import 'package:bloc/bloc.dart';
import 'package:listwhatever/auth/auth_repository.dart';
import 'package:meta/meta.dart';

part 'auth_event.dart';
part 'auth_state.dart';

class AuthBloc extends Bloc<AuthEvent, AuthState> {
  AuthBloc({required this.authRepository}) : super(AuthInitial()) {
    on<LoginWithApple>(_onLoginWithApple);
    on<LoginWithGoogle>(_onLoginWithGoogle);
    on<LoginWithEmailAndPassword>(_onLoginWithEmailAndPassword);
    on<SignUpWithApple>(_onSignUpWithApple);
    on<SignUpWithGoogle>(_onSignUpWithGoogle);
  }

  final AuthRepository authRepository;

  void _onLoginWithApple(LoginWithApple event, Emitter<AuthState> emit) {}
  void _onLoginWithGoogle(LoginWithGoogle event, Emitter<AuthState> emit) {}
  void _onLoginWithEmailAndPassword(
    LoginWithEmailAndPassword event,
    Emitter<AuthState> emit,
  ) {}
  void _onSignUpWithApple(SignUpWithApple event, Emitter<AuthState> emit) {}
  void _onSignUpWithGoogle(SignUpWithGoogle event, Emitter<AuthState> emit) {}
}
