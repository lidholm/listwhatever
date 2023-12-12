import 'package:equatable/equatable.dart';

class Link extends Equatable {
  const Link(this.key, this.title, this.callback);

  final String key;
  final String title;
  final Future<void> Function() callback;

  @override
  List<Object> get props => [key, title, callback];

  @override
  bool get stringify => true;
}
