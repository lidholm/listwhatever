import 'package:flutter/material.dart';
import 'package:listwhatever/form/form_input_field_info.dart';

const String className = 'FormInputFieldTextArea';
const double widthForRightHandSideView = 200;

class FormInputFieldShimmer extends StatelessWidget {
  const FormInputFieldShimmer({required this.field, super.key});

  final FormInputFieldInfoShimmer field;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16),
      child: Column(
        children: [
          Container(
            width: widthForRightHandSideView,
            height: 72,
            decoration: BoxDecoration(
              color: Colors.black,
              borderRadius: BorderRadius.circular(16),
            ),
          ),
        ],
      ),
    );
  }
}
