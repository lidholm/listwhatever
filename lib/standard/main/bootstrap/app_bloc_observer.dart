import 'package:bloc/bloc.dart';
import 'package:listwhatever/standard/helpers/logger_helper.dart';
import '/standard/analyticsRepository/analytics_repository.dart';
import '/standard/analyticsRepository/models/analytics_event.dart';

class AppBlocObserver extends BlocObserver {
  AppBlocObserver({
    required AnalyticsRepository analyticsRepository,
  }) : _analyticsRepository = analyticsRepository;

  final String className = 'AppBlocObserver';
  final AnalyticsRepository _analyticsRepository;

  @override
  void onTransition(
    Bloc<dynamic, dynamic> bloc,
    Transition<dynamic, dynamic> transition,
  ) {
    super.onTransition(bloc, transition);
  }

  @override
  void onError(BlocBase<dynamic> bloc, Object error, StackTrace stackTrace) {
    super.onError(bloc, error, stackTrace);
    LoggerHelper.logger.e(
      '$className onError ${bloc.runtimeType}',
      error: error,
      stackTrace: stackTrace,
    );
  }

  @override
  void onChange(BlocBase<dynamic> bloc, Change<dynamic> change) {
    super.onChange(bloc, change);
    final dynamic state = change.nextState;
    if (state is AnalyticsEventMixin) _analyticsRepository.track(state.event);
  }

  @override
  void onEvent(Bloc<dynamic, dynamic> bloc, Object? event) {
    super.onEvent(bloc, event);
    if (event is AnalyticsEventMixin) _analyticsRepository.track(event.event);
  }
}
