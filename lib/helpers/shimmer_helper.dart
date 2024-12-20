import 'package:listwhatever/form/form_input_field_info.dart';

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
