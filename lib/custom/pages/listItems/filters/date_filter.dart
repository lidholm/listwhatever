import 'package:flutter/material.dart';
import 'package:flutter_form_builder/flutter_form_builder.dart';
import 'package:intl/intl.dart';
import 'package:listwhatever/standard/helpers/date_format_helper.dart';
import 'package:listwhatever/standard/helpers/date_helper.dart';
import '/standard/widgets/border_with_header.dart';

const startDateFieldName = 'startDate';
const endDateFieldName = 'endDate';

class DateFilter extends StatefulWidget {
  const DateFilter({
    required this.formKey,
    super.key,
  });
  final GlobalKey<FormBuilderState> formKey;

  @override
  State<DateFilter> createState() => _DateFilterState();
}

class _DateFilterState extends State<DateFilter> {
  DateTime? startDate;
  DateTime? endDate;

  @override
  Widget build(BuildContext context) {
    return BorderWithHeader(
      title: 'Dates',
      child: Column(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              const Text('Start date: '),
              getDatePicker(
                widget.formKey,
                startDateFieldName,
                () => setState(() {
                  startDate = null;
                  widget.formKey.currentState?.fields[startDateFieldName]
                      ?.didChange(startDate);
                }),
              ),
            ],
          ),
          const SizedBox(height: 8),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              const Text('End date:'),
              getDatePicker(
                widget.formKey,
                endDateFieldName,
                () => setState(() {
                  endDate = null;
                  widget.formKey.currentState?.fields[endDateFieldName]
                      ?.didChange(endDate);
                }),
              ),
            ],
          ),
        ],
      ),
    );
  }

  Widget getDatePicker(
    GlobalKey<FormBuilderState> formKey,
    String name,
    void Function()? clearCallback,
  ) {
    return SizedBox(
      width: 200,
      height: 40,
      child: FormBuilderDateTimePicker(
        decoration: InputDecoration(
          suffixIcon: IconButton(
            icon: const Icon(Icons.close),
            onPressed: clearCallback,
          ),
        ),
        name: name,
        inputType: InputType.date,
        firstDate: DateHelper.minDateTime,
        lastDate: DateHelper.maxDateTime,
        format: getDateFormatter(),
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

  DateFormat getDateFormatter() {
    return DateFormatHelper.dateFormatter;
    // TODO: return firestoreUser?.settings.dateFormatType == DateFormatType.ISO_8601
    //     ? dateFormatter
    //     : usDateFormatter;
  }
}
