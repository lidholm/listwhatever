import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:listwhatever/standard/onScreenLog/on_screen_log_bloc.dart';
import 'package:listwhatever/standard/onScreenLog/on_screen_log_event.dart';
import 'package:listwhatever/standard/onScreenLog/on_screen_log_state.dart';
import 'package:listwhatever/standard/widgets/appBar/common_app_bar.dart';

class OnScreenLogsPage extends StatefulWidget {
  const OnScreenLogsPage({super.key});

  @override
  State<OnScreenLogsPage> createState() => _OnScreenLogsPageState();
}

class _OnScreenLogsPageState extends State<OnScreenLogsPage> {
  @override
  Widget build(BuildContext context) {
    final dataBloc = BlocProvider.of<DataBloc>(context);
    return  Scaffold(
      appBar: const CommonAppBar(title: 'Logs'),
      body: BlocBuilder<DataBloc, DataState>(
        builder: (context, state) {
          return switch (state) {
            Initial() => const Center(child: Text('Press the Button')),
            Loading() => const Center(child: Text('Press the Button')),
            Success() => const Center(child: Text('Success')),
          };
        },
      ),
      floatingActionButton: Column(
        crossAxisAlignment: CrossAxisAlignment.end,
        mainAxisAlignment: MainAxisAlignment.end,
        children: <Widget>[
          FloatingActionButton(
            child: const Icon(Icons.play_arrow),
            onPressed: () {
              dataBloc.add(FetchData());
            },
          ),
        ],
      ),
    );
  }
}
