import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '/standard/bloc/login_bloc.dart';
import '/standard/bloc/login_state.dart';
import '/standard/onScreenLog/on_screen_log_cubit.dart';

class ToOnScreenLogsListener extends StatelessWidget {
  const ToOnScreenLogsListener({
    required this.child,
    super.key,
  });

  final Widget child;

  @override
  Widget build(BuildContext context) {
    return BlocListener<LoginBloc, LoginState>(
      listener: (context, state) {
        if (state.errorMessage != null) {
          context.read<OnScreenLogsCubit>().log(
              state.errorMessage!,
          );
        }
      },
      listenWhen: (previous, current) => previous.errorMessage != current.errorMessage,
      child: child,
    );
  }
}
