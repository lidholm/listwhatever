import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:listanything/app/pages/map/searchLocation/search_location_page.dart';

@immutable
class SearchLocationForEditPageRoute extends GoRouteData {
  const SearchLocationForEditPageRoute({
    this.searchPhrase,
    required this.publicListId,
    required this.listItemId,
  });
  final String? searchPhrase;
  final String publicListId;
  final String listItemId;

  @override
  Widget build(BuildContext context, GoRouterState state) {
    return SearchLocationPage(
      searchPhrase,
      publicListId: publicListId,
      listItemId: listItemId,
    );
  }
}
