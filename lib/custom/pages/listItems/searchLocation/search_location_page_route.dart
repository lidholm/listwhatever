import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

import 'search_location_page.dart';

@immutable
class SearchLocationPageRoute extends GoRouteData {
  const SearchLocationPageRoute();

  @override
  Widget build(BuildContext context, GoRouterState state) {
    return const SearchLocationPage();
  }
}
