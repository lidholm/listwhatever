import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:listwhatever/standard/onScreenLog/on_screen_log_cubit.dart';
import 'package:listwhatever/standard/widgets/appBar/common_app_bar.dart';

class OnScreenLogsPage extends StatefulWidget {
  const OnScreenLogsPage({super.key});

  @override
  State<OnScreenLogsPage> createState() => _OnScreenLogsPageState();
}

class _OnScreenLogsPageState extends State<OnScreenLogsPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const CommonAppBar(title: 'Logs'),
      body: BlocBuilder<OnScreenLogsCubit, List<String>>(
        builder: (context, state) {
          return SingleChildScrollView(
            child: Column(
              children: state.map(Text.new).toList(),
            ),
          );
        },
      ),
    );
  }
}
