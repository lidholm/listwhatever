import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:listanything/app/pages/lists/list_of_things.dart';
import 'package:listanything/app/pages/lists/lists_provider.dart';
import 'package:listanything/app/widgets/standardWidgets/async_value_widget.dart';
import 'package:listanything/app/widgets/standardWidgets/common_app_bar.dart';
import 'package:share_plus/share_plus.dart';

final shareTypeProvider = StateProvider((ref) => 'Viewer');

class ShareListPage extends ConsumerWidget {
  const ShareListPage({super.key, required this.publicListId});
  final String publicListId;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final shareTypes = ['Viewer', 'Editor'];
    final shareType = ref.watch(shareTypeProvider);

    return Scaffold(
      appBar: const CommonAppBar(title: 'Share list'),
      body: AsyncValueWidget<ListOfThings>(
        value: ref.watch(listProvider(publicListId)),
        data: (list) {
          final shareCode = shareType == 'Viewer' ? list.shareCodeForViewer! : list.shareCodeForEditor!;
          return Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const Text(
                'Share list with friends',
                style: TextStyle(fontWeight: FontWeight.bold, color: Colors.black, fontSize: 20),
              ),
              SizedBox(
                width: 250,
                child: DropdownButton<String>(
                  hint: const Text('Select type of sharing'),
                  isExpanded: true,
                  value: shareType,
                  elevation: 16,
                  underline: Container(
                    height: 0,
                  ),
                  onChanged: (String? value) {
                    ref.read(shareTypeProvider.notifier).state = value!;
                  },
                  items: shareTypes.map<DropdownMenuItem<String>>((String value) {
                    return DropdownMenuItem<String>(
                      value: value,
                      child: Align(alignment: Alignment.centerLeft, child: Text(value)),
                    );
                  }).toList(),
                ),
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  ElevatedButton(
                    onPressed: () {
                      _copyUrl(generateUrl(publicListId, shareCode));
                    },
                    child: const Text('Copy url'),
                  ),
                  const SizedBox(
                    width: 16,
                  ),
                  ElevatedButton(
                    onPressed: () {
                      _shareUrl(generateUrl(publicListId, shareCode));
                    },
                    child: const Text('Share url'),
                  ),
                  const SizedBox(
                    width: 16,
                  ),
                  ElevatedButton(
                    onPressed: () {
                      GoRouter.of(context).pop();
                    },
                    child: const Text('Close'),
                  ),
                ],
              )
            ],
          );
        },
      ),
    );
  }

  String generateUrl(String publicListId, String shareCode) {
    return 'http://localhost:5000/lists/$publicListId/shareCode/$shareCode';
  }

  Future<void> _copyUrl(String url) async {
    await Clipboard.setData(ClipboardData(text: url));
  }

  Future<void> _shareUrl(String url) async {
    await Share.share(url);
  }
}
