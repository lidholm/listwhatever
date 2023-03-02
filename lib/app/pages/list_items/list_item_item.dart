import 'package:flutter/material.dart';
import 'package:listanything/app/helpers/constants.dart';
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
        child: ListView(
          shrinkWrap: true,
          padding: const EdgeInsets.fromLTRB(0, 0, 0, 8),
          children: <Widget>[
            inHeader(
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Padding(
                    padding: const EdgeInsets.fromLTRB(0, 8, 0, 4),
                    child: Text(
                      item.name,
                      style: const TextStyle(fontSize: 24),
                    ),
                  ),
                  if (item.datetime != null)
                    Padding(
                      padding: const EdgeInsets.fromLTRB(0, 0, 8, 0),
                      child: Text(
                        dateFormatter.format(item.datetime!),
                        style: const TextStyle(fontSize: 18),
                      ),
                    ),
                ],
              ),
            ),
            if (item.address?.trim().isNotEmpty ?? false)
              inHeader(
                Padding(
                  padding: const EdgeInsets.fromLTRB(0, 0, 0, 4),
                  child: Text(
                    item.address!,
                    style: const TextStyle(fontSize: 16),
                  ),
                ),
              ),
            const SizedBox(height: 8),
            if (isLoading)
              ...leftPaddings(getCategoriesShimmers())
            else ...[
              ...leftPaddings(
                categoriesToShow
                    .map(
                      (c) => Row(
                        children: getCategories(c),
                      ),
                    )
                    .toList(),
              ),
              if (item.categories.entries.length > 4) const Text('...'),
            ]
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

  Widget inHeader(Widget child) {
    return Container(
      color: Colors.lightBlue[100],
      child: leftPadding(child),
    );
  }

  Widget leftPadding(Widget child) {
    return Padding(padding: const EdgeInsets.fromLTRB(8, 0, 0, 0), child: child);
  }

  List<Widget> leftPaddings(List<Widget> children) {
    return children.map(leftPadding).toList();
  }
}
