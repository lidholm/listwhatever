import 'package:flutter/material.dart';
import 'package:flutter_form_builder/flutter_form_builder.dart';
import 'package:form_builder_validators/form_builder_validators.dart';
import 'package:listwhatever/standard/form/form_input_field.dart';
import 'package:listwhatever/standard/widgets/vStack/v_stack.dart';

class FormGenerator extends StatefulWidget {
  const FormGenerator({
    required this.formKey,
    required this.sectionNames,
    required this.fields,
    super.key,
  });

  final GlobalKey<FormBuilderState> formKey;
  final List<String> sectionNames;
  // ignore: strict_raw_type
  final List<FormInputField> fields;

  @override
  State<StatefulWidget> createState() {
    return _FormGeneratorState();
  }
}

class _FormGeneratorState extends State<FormGenerator> {
  // ignore: strict_raw_type
  late final List<FormInputField> formInputFields;

  @override
  void initState() {
    super.initState();
    formInputFields = widget.fields;
  }

  @override
  Widget build(BuildContext context) {
    return VStack(
      children: widget.sectionNames
          .map(generateSection)
          .expand((innerList) => innerList)
          .toList(),
    );
  }

  List<Widget> generateSection(String sectionName) {
    final sectionFields =
        formInputFields.where((f) => f.sectionName == sectionName);
    final fields = sectionFields.map(generateField).toList();

    return [
      Text(sectionName),
      ...fields,
    ];
  }

  Widget generateField<T>(FormInputField<T> field) {
    return switch (field) {
      FormInputFieldTextArea() => generateTextAreaField(field),
      FormInputFieldDropDown() => generateDropDownField(field),
      FormInputFieldCheckbox<T>() => generateCheckboxField(field),
    };
  }

  Widget generateTextAreaField<T>(FormInputFieldTextArea<T> field) {
    return FormBuilderTextField(
      autovalidateMode: AutovalidateMode.always,
      name: field.id,
      decoration: InputDecoration(
        labelText: field.label,
        suffixIcon: field.hasError
            ? const Icon(Icons.error, color: Colors.red)
            : const Icon(Icons.check, color: Colors.green),
      ),
      // valueTransformer: (text) => num.tryParse(text),
      validator: FormBuilderValidators.compose(field.validators),
      keyboardType: TextInputType.name,
      textInputAction: TextInputAction.next,
    );
  }

  Widget generateDropDownField<T>(FormInputFieldDropDown<T> field) {
    return Row(
      children: [
        Expanded(
          child: FormBuilderDropdown<T>(
            name: field.id,
            decoration: InputDecoration(
              labelText: 'Type',
              suffix: field.hasError
                  ? const Icon(Icons.error)
                  : const Icon(Icons.check),
              hintText: 'Select Type',
            ),
            validator: FormBuilderValidators.compose(
              [FormBuilderValidators.required()],
            ),
            items: field.options
                .map(
                  (type) => DropdownMenuItem(
                    alignment: AlignmentDirectional.center,
                    value: type,
                    child: Text(field.optionToString(type)),
                  ),
                )
                .toList(),
            onChanged: (val) {},
            valueTransformer: (val) => val?.toString(),
          ),
        ),
        const SizedBox(width: 16),
        // FutureBuilder(
        //   future: getFirebaseStorage(),
        //   builder: (context, snapshot) {
        //     final firebaseStorage = snapshot.data;
        //     if (firebaseStorage == null) {
        //       return Container();
        //     }
        //     final imageFilename = getImageFilename();
        //     logger.i('$className => imageFilename: $imageFilename');
        //     final imageUrlFuture = firebaseStorage
        //         .ref()
        //         .child('images')
        //         .child(imageFilename)
        //         .getDownloadURL();
        //     return FutureBuilder(
        //       future: imageUrlFuture,
        //       builder: (context, snapshot) {
        //         final imageUrl = snapshot.data;
        //         logger.i('$className => imageUrl: $imageUrl');
        //         return SizedBox(
        //           width: imageSize,
        //           height: imageSize,
        //           child: ClipRRect(
        //             borderRadius: BorderRadius.circular(8),
        //             child: imageUrl != null
        //                 ? Image.network(imageUrl, fit: BoxFit.cover)
        //                 : Container(),
        //           ),
        //         );
        //       },
        //     );
        //   },
        // ),
        // const SizedBox(width: 16),
        // if (_uploadTask == null)
        //   const Center(child: Text("Press the '+' button to add a new file."))
        // else
        //   Expanded(
        //     child: UploadTaskListTile(
        //       task: _uploadTask!,
        //       onDismissed: () {}, // => _removeTaskAtIndex(index),
        //       onDownloadLink: () async {
        //         // return _downloadLink(_uploadTasks[index].snapshot.ref);
        //       },
        //       onDownload: () async {
        //         // if (kIsWeb) {
        //         //   return _downloadBytes(_uploadTasks[index].snapshot.ref);
        //         // } else {
        //         //   return _downloadFile(_uploadTasks[index].snapshot.ref);
        //         // }
        //       },
        //       onDelete: () async {
        //         // return _delete(_uploadTasks[index].snapshot.ref);
        //       },
        //     ),
        //   ),
        // ElevatedButton(
        //   onPressed: () async {
        //     final picker = ImagePicker();
        //     final pickedFile =
        //         await picker.pickImage(source: ImageSource.gallery);

        //     if (pickedFile != null) {
        //       final tmp = await uploadImage(pickedFile);
        //       setState(() {
        //         logger.i('$className => pickedFile.path: ${pickedFile.path}');
        //         _uploadTask = tmp;
        //         logger.i('$className => _uploadTask: $_uploadTask');
        //       });
        //     } else {
        //       logger.i('$className => No image selected.');
        //     }
        //   },
        //   child: const Padding(
        //     padding: EdgeInsets.fromLTRB(16, 0, 16, 0),
        //     child: Text('Upload image'),
        //   ),
        // ),
      ],
    );
  }

  Widget generateCheckboxField<T>(FormInputFieldCheckbox<T> field) {
    return FormBuilderCheckbox(
      autovalidateMode: AutovalidateMode.always,
      name: field.id,
      decoration: InputDecoration(
        labelText: field.label,
        suffixIcon: field.hasError
            ? const Icon(Icons.error, color: Colors.red)
            : const Icon(Icons.check, color: Colors.green),
      ),
      // valueTransformer: (text) => num.tryParse(text),
      validator: FormBuilderValidators.compose(field.validators),
      title: Text(field.label),
    );
  }
}
