
import 'package:equatable/equatable.dart';

abstract class AnalyticsState extends Equatable {
  const AnalyticsState();
}

class AnalyticsInitial extends AnalyticsState {
  @override
  List<Object> get props => [];
}
