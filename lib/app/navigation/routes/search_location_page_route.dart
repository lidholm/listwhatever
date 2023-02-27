import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:listanything/app/pages/map/searchLocation/search_location_page.dart';

@immutable
class SearchLocationPageRoute extends GoRouteData {
  const SearchLocationPageRoute({this.searchPhrase});
  final String? searchPhrase;

  @override
  Widget build(BuildContext context, GoRouterState state) {
    return SearchLocationPage(searchPhrase);
  }
}
