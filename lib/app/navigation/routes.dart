import 'package:flutter/material.dart';
import 'package:flutterbase/app/pages/counter/counter_page.dart';
import 'package:go_router/go_router.dart';

part 'routes.g.dart';

@TypedGoRoute<CounterPageRoute>(
  path: '/',
  // routes: [
  //   TypedGoRoute<SongRoute>(
  //     path: 'song/:id',
  //   )
  // ],
)
@immutable
class CounterPageRoute extends GoRouteData {
  @override
  Widget build(BuildContext context, GoRouterState state) {
    return const CounterPage();
  }
}

// @immutable
// class SongRoute extends GoRouteData {
//   const SongRoute({
//     required this.id,
//   });
//   final int id;

//   @override
//   Widget build(BuildContext context) {
//     return SongScreen(songId: id.toString());
//   }
// }
