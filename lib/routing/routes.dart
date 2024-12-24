import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:listwhatever/pages/auth/routes/login_page_route.dart';
import 'package:listwhatever/pages/list/routes/add_list_item_page_route.dart';
import 'package:listwhatever/pages/list/routes/lists_page_route.dart';
import 'package:listwhatever/pages/lists/routes/add_list_page_route.dart';
import 'package:listwhatever/pages/lists/routes/lists_page_route.dart';

part 'routes.g.dart';

@TypedGoRoute<MainPageRoute>(
  path: '/',
  routes: [
    TypedGoRoute<ListsPageRoute>(
      path: 'lists',
      name: 'lists',
      routes: [
        TypedGoRoute<ListPageRoute>(
          path: ':actualListId',
          name: 'items',
          routes: [
            TypedGoRoute<AddListItemPageRoute>(
              path: 'add',
              name: 'addListItem',
            ),
            //       TypedGoRoute<EditListItemPageRoute>(
            //         path: ':itemId/edit',
            //         name: 'editListItem',
            //       ),
          ],
        ),
        TypedGoRoute<AddListPageRoute>(
          path: 'add',
          name: 'addList',
        ),
      ],
    ),
    // TypedGoRoute<UserProfilePageRoute>(
    //   path: 'user_profile',
    //   name: 'user_profile',
    // ),
    TypedGoRoute<LoginPageRoute>(
      path: 'login',
      name: 'login',
    ),
  ],
)
@immutable
class MainPageRoute extends GoRouteData {
  @override
  Widget build(BuildContext context, GoRouterState state) {
    return Column(
      children: [
        const Text('Home'),
        ElevatedButton(
          onPressed: () {
            const ListsPageRoute().go(context);
          },
          child: const Text('Lists'),
        ),
      ],
    );
  }
}
