import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import '/app/custom/pages/map/searchLocation/search_location_page.dart';

@immutable
class SearchLocationForAddPageRoute extends GoRouteData {
  const SearchLocationForAddPageRoute({
    required this.publicListId,
    this.listItemId,
    this.searchPhrase,
  });
  final String? searchPhrase;
  final String publicListId;
  final String? listItemId;

  @override
  Widget build(BuildContext context, GoRouterState state) {
    return SearchLocationPage(
      searchPhrase,
      publicListId: publicListId,
      listItemId: listItemId,
    );
  }
}
