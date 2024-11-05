import 'package:listwhatever/custom/pages/listItems/filters/filters.dart';
import 'package:listwhatever/custom/pages/listItems/models/list_item.dart';
import 'package:listwhatever/custom/pages/lists/models/list_of_things.dart';
import 'package:listwhatever/custom/pages/lists/models/list_type.dart';
import 'package:listwhatever/custom/pages/lists/models/user_list.dart';
import 'package:listwhatever/standard/form/form_input_field_info.dart';
import 'package:listwhatever/standard/settings/settings.dart';
import 'package:listwhatever/standard/userRepository/models/user.dart';

class ShimmerHelper {
  static ListOfThings generateShimmerList() {
    return const ListOfThings(
      id: '-1',
      name: 'Shimmer',
      listType: ListType.other,
      withMap: true,
      withDates: true,
      withTimes: true,
      shared: false,
      sharedWith: {},
      ownerId: '-1',
    );
  }

  static List<ListItem> generateShimmerListItem(int count) {
    return List.generate(
      count,
      (i) => const ListItem(
        id: '-1',
        name: 'Shimmer',
      ),
    );
  }

  static User generateShimmerUser() {
    return const User(
      id: '-1',
      email: '',
      name: '',
      photo: '',
      settings: Settings(distanceUnit: DistanceUnitOptions.kilometers),
    );
  }

  static List<UserList> generateShimmerUserLists(int count) {
    return List.generate(
      count,
      (i) => const UserList(
        id: '',
        listId: '',
        listName: '',
        listType: ListType.other,
        imageFilename: '',
        ownerId: '',
        isOwnList: false,
      ),
    );
  }

  static Filters generateShimmerFilters() {
    return Filters();
  }

  static List<FormInputFieldInfo> generateShimmerFormFields(
    int count,
    String sectionName,
  ) {
    return List.generate(
      count,
      (i) => FormInputFieldInfo.shimmer(sectionName: sectionName),
    );
  }
}
