import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:listanything/app/helpers/constants.dart';
import 'package:listanything/app/navigation/routes/edit_list_item_route.dart';
import 'package:listanything/app/navigation/routes/list_item_details_page_route.dart';
import 'package:listanything/app/navigation/routes/routes.dart';
import 'package:listanything/app/pages/list_items/list_item.dart';
import 'package:listanything/app/string_extensions.dart';
import 'package:listanything/app/widgets/standardWidgets/shimmer_loading.dart';

class ListItemItem extends ConsumerWidget {
  const ListItemItem({
    super.key,
    required this.publicListId,
    required this.isListViewOnly,
    required this.item,
    required this.isLoading,
  });

  final String publicListId;
  final bool isListViewOnly;
  final ListItem item;
  final bool isLoading;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return ShimmerLoading(
      isLoading: isLoading,
      child: Container(
        decoration: BoxDecoration(
          color: Colors.orange[800],
          borderRadius: BorderRadius.circular(16),
          border: Border.all(color: const Color.fromARGB(255, 249, 171, 37)),
        ),
        child: Padding(
          padding: const EdgeInsets.all(16),
          child: InkWell(
            onTap: () {
              isListViewOnly
                  ? ListItemDetailsPageRoute(publicListId: publicListId, listItemId: item.id).push(context)
                  : EditListItemRoute(publicListId: publicListId, listItemId: item.id).push(context);
            },
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      item.name,
                      style: const TextStyle(fontSize: 24, color: Colors.white),
                    ),
                    Text(
                      item.datetime != null ? formatReadableDate(item.datetime!) : '',
                      style: TextStyle(fontSize: 16, color: Colors.white.withAlpha(200)),
                    ),
                  ],
                ),
                IconButton(
                  onPressed: () {},
                  icon: const Icon(Icons.keyboard_arrow_right_rounded, color: Colors.white),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }

  List<Widget> getCategories(MapEntry<String, List<String>> c) {
    return [
      Text(
        '${c.key.toCapitalized()}: ',
        style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 16),
      ),
      Text(
        c.value.join(', '),
        style: const TextStyle(fontSize: 16),
      ),
    ];
  }

  List<Widget> getCategoriesShimmers() {
    return [
      Container(
        decoration: const BoxDecoration(color: Colors.red),
        height: 12,
        width: 160,
      ),
      const SizedBox(height: 10),
      Container(
        decoration: const BoxDecoration(color: Colors.red),
        height: 12,
        width: 180,
      ),
      const SizedBox(height: 10),
      Container(
        decoration: const BoxDecoration(color: Colors.red),
        height: 12,
        width: 150,
      )
    ];
  }
}
