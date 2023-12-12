part of 'analytics_bloc.dart';

sealed class AnalyticsEvent extends Equatable {
  const AnalyticsEvent();
}

class TrackAnalyticsEvent extends AnalyticsEvent {
  const TrackAnalyticsEvent(this.event);

  final analytics.AnalyticsEvent event;

  @override
  List<Object> get props => [event];
}
