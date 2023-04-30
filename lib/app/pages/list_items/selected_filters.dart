import 'package:flutter/material.dart';
import 'package:listanything/app/helpers/constants.dart';
import 'package:listanything/app/pages/list_items/filters.dart';

class SelectedFilters extends StatelessWidget {
  const SelectedFilters({
    required this.filters,
    super.key,
  });
  final Filters filters;

  @override
  Widget build(BuildContext context) {
    final filteredFilters = removeNonSetFilters(filters);

    return SliverToBoxAdapter(
      child: Padding(
        padding: const EdgeInsets.fromLTRB(24, 0, 24, 0),
        child: SizedBox(
          height: 88,
          child: ListView.builder(
            scrollDirection: Axis.horizontal,
            itemCount: filteredFilters.length,
            itemBuilder: (context, index) {
              final filter = filteredFilters.entries.toList()[index];
              return Padding(
                padding: const EdgeInsets.fromLTRB(0, 0, 8, 0),
                child: Container(
                  constraints: const BoxConstraints(
                    minWidth: 140,
                  ),
                  decoration: BoxDecoration(
                    color: Colors.orange[800],
                    borderRadius: BorderRadius.circular(16),
                    border: Border.all(
                      color: const Color.fromARGB(255, 249, 171, 37),
                    ),
                  ),
                  child: Padding(
                    padding: const EdgeInsets.all(16),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Padding(
                              padding: const EdgeInsets.fromLTRB(8, 0, 0, 6),
                              child: Text(
                                filter.key,
                                style: TextStyle(
                                  fontSize: 20,
                                  color: Colors.orange.shade50,
                                  fontWeight: FontWeight.w600,
                                ),
                              ),
                            ),
                            Text(
                              filter.value.join(', '),
                              style: const TextStyle(
                                fontSize: 24,
                                color: Colors.white,
                                fontWeight: FontWeight.w500,
                              ),
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                ),
              );
            },
          ),
        ),
      ),
    );
  }

  Map<String, List<String>> removeNonSetFilters(Filters filters) {
    var dateFilter = '';
    if (filters.startDate != null && filters.endDate != null) {
      dateFilter =
          '${formatReadableDate(filters.startDate!)} - ${formatReadableDate(filters.endDate!)}';
    } else if (filters.startDate != null) {
      dateFilter = 'After ${formatReadableDate(filters.startDate!)}';
    } else if (filters.endDate != null) {
      dateFilter = 'Before ${formatReadableDate(filters.endDate!)}';
    }

    return Map.fromEntries(
      filters.categoryFilters.entries
          .where((element) => element.value.isNotEmpty),
    )..addAll(
        dateFilter == ''
            ? {}
            : {
                'Dates': [dateFilter]
              },
      );
  }
}
