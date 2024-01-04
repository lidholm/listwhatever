import 'package:flutter/material.dart';
import 'package:listwhatever/standard/widgets/appBar/common_app_bar.dart';

class ImportCsvPage extends StatefulWidget {
  const ImportCsvPage({super.key});

  @override
  State<ImportCsvPage> createState() => _ImportCsvPageState();
}

class _ImportCsvPageState extends State<ImportCsvPage> {
  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      appBar: CommonAppBar(title: 'Import CSV'),
      body: Text('Import'),
    );
  }
}
