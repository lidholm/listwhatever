import 'package:listwhatever/custom/pages/listItems/filters/filters.dart';
import 'package:listwhatever/custom/pages/listItems/models/list_item.dart';
import 'package:listwhatever/custom/pages/lists/models/list_of_things.dart';
import 'package:listwhatever/custom/pages/lists/models/list_type.dart';
import 'package:listwhatever/custom/pages/lists/models/user_list.dart';
import 'package:listwhatever/standard/form/form_input_field_info.dart';
import 'package:listwhatever/standard/settings/settings.dart';
import 'package:listwhatever/standard/userRepository/models/user.dart';

class ShimmerHelper {
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
