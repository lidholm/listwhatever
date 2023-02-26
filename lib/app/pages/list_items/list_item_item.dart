import 'package:flutter/material.dart';
import 'package:listanything/app/pages/list_items/list_item.dart';
import 'package:listanything/app/string_extensions.dart';
import 'package:listanything/app/widgets/standardWidgets/shimmer_loading.dart';

class ListItemItem extends StatelessWidget {
  const ListItemItem({super.key, required this.item, required this.isLoading});

  final ListItem item;
  final bool isLoading;

  @override
  Widget build(BuildContext context) {
    final categoriesToShow =
        item.categories.entries.length > 4 ? item.categories.entries.take(3) : item.categories.entries;

    return ShimmerLoading(
      isLoading: isLoading,
      child: Container(
        decoration: BoxDecoration(
          border: Border.all(color: Colors.blueAccent),
        ),
        height: 80,
        alignment: Alignment.center,
        child: Row(
          children: [
            Container(
              height: double.infinity,
              decoration: BoxDecoration(
                color: Colors.lightBlue[100],
                border: const Border(
                  right: BorderSide(color: Colors.blueAccent),
                ),
              ),
              child: Center(
                child: Padding(
                  padding: const EdgeInsets.fromLTRB(16, 0, 16, 0),
                  child: SizedBox(
                    width: 120,
                    child: Text(
                      item.name,
                      style: const TextStyle(fontSize: 24),
                    ),
                  ),
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.fromLTRB(16, 0, 0, 0),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: isLoading
                    ? getCategoriesShimmers()
                    : [
                        ...categoriesToShow
                            .map(
                              (c) => Row(
                                children: getCategories(c),
                              ),
                            )
                            .toList(),
                        if (item.categories.entries.length > 4) const Text('...'),
                      ],
              ),
            )
          ],
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
