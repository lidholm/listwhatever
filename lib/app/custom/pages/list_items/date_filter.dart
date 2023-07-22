import 'package:flutter/material.dart';
import 'package:flutter_form_builder/flutter_form_builder.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:intl/intl.dart';
import '/app/custom/pages/settings/settings.dart';
import '/app/standard/firebase/current_user.dart';
import '/app/standard/helpers/constants.dart';
import '/app/standard/navigation/current_user_provider.dart';
import '/app/standard/widgets/async_value_widget.dart';
import '/app/standard/widgets/border_with_header.dart';

const startDateFieldName = 'startDate';
const endDateFieldName = 'endDate';

class DateFilter extends HookConsumerWidget {
  const DateFilter({
    required this.formKey,
    super.key,
  });
  final GlobalKey<FormBuilderState> formKey;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final startDate = useState<DateTime?>(null);
    final endDate = useState<DateTime?>(null);
    final startDateError = useState<bool>(false);
    final endDateError = useState<bool>(false);
    final errors = [startDateError, endDateError];
    final firestoreUserValue = ref.watch(currentUserProvider);

    return AsyncValueWidget(
      value: firestoreUserValue,
      data: (firestoreUser) => BorderWithHeader(
        title: 'Dates',
        child: Column(
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                const Text('Start date: '),
                getDatePicker(
                  formKey,
                  startDateFieldName,
                  startDate,
                  errors,
                  firestoreUser,
                ),
              ],
            ),
            const SizedBox(height: 8),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                const Text('End date:'),
                getDatePicker(
                  formKey,
                  endDateFieldName,
                  endDate,
                  errors,
                  firestoreUser,
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }

  Widget getDatePicker(
    GlobalKey<FormBuilderState> formKey,
    String name,
    ValueNotifier<DateTime?> date,
    List<ValueNotifier<bool>> dateErrors,
    CurrentUser? firestoreUser,
  ) {
    return SizedBox(
      width: 200,
      height: 40,
      child: FormBuilderDateTimePicker(
        decoration: InputDecoration(
          suffixIcon: IconButton(
            icon: const Icon(Icons.close),
            onPressed: () {
              date.value = null;
              formKey.currentState?.fields[name]?.didChange(date.value);
            },
          ),
        ),
        name: name,
        inputType: InputType.date,
        firstDate: minDateTime,
        lastDate: maxDateTime,
        format: getDateFormatter(firestoreUser),
        onChanged: (val) {
          dateErrors[0].value =
              !(formKey.currentState?.fields[startDateFieldName]?.validate() ??
                  false);
          dateErrors[1].value =
              !(formKey.currentState?.fields[endDateFieldName]?.validate() ??
                  false);
        },
        validator: (val) {
          final startDate = formKey
              .currentState?.fields[startDateFieldName]?.value as DateTime?;
          final endDate = formKey.currentState?.fields[endDateFieldName]?.value
              as DateTime?;
          if (startDate != null && endDate != null) {
            if (startDate.compareTo(endDate) > 0) {
              return 'Start date has to be before end date';
            }
          }

          return null;
        },
      ),
    );
  }

  DateFormat getDateFormatter(CurrentUser? firestoreUser) {
    return firestoreUser?.settings.dateFormatType == DateFormatType.ISO_8601
        ? dateFormatter
        : usDateFormatter;
  }
}
