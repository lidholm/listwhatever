import 'package:equatable/equatable.dart';
import 'package:listwhatever/standard/analyticsRepository/models/analytics_event.dart';

sealed class BaseAnalyticsEvent extends Equatable {
  const BaseAnalyticsEvent();
}

class TrackAnalyticsEvent extends BaseAnalyticsEvent {
  const TrackAnalyticsEvent(this.event);

  final AnalyticsEvent event;

  @override
  List<Object> get props => [event];
}
