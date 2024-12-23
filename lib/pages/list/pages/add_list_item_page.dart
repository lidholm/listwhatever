import 'package:flutter/material.dart';
import 'package:listwhatever/pages/list/components/add_list_item_form.dart';

class AddListItemPage extends StatefulWidget {
  const AddListItemPage({super.key});

  @override
  State<AddListItemPage> createState() => _AddListItemPageState();
}

class _AddListItemPageState extends State<AddListItemPage> {
  @override
  void initState() {
    super.initState();
    // BlocProvider.of<ListsBloc>(context).add(const ListsEvent.watchUserLists());
    // BlocProvider.of<FirebaseStorageBloc>(context)
    //     .add(const FirebaseStorageEvent.getAllUserLists());
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Add list item'),
      ),
      body: AddListItemForm(list: null),
    );
  }
}
