import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:integration_test/integration_test.dart';

import 'package:listwhatever/app/view/app.dart';

void main() {
  IntegrationTestWidgetsFlutterBinding.ensureInitialized();

  group('end-to-end test', () {
    testWidgets('add a pet and verify one is added', (tester) async {
      // Load app widget.
      await tester.pumpWidget(const App());

      // Finds the floating action button to tap on.
      final tab = find.byKey(const ValueKey('pets'));

      // Emulate a tap on the floating action button.
      await tester.tap(tab);
      await tester.pumpAndSettle();

      // Finds the floating action button to tap on.
      final fab = find.byKey(const ValueKey('addpet'));

      // Emulate a tap on the floating action button.
      await tester.tap(fab);

      // Trigger a frame.
      await tester.pumpAndSettle();

      // Verify the counter increments by 1.
      expect(find.byType(ListTile), findsOneWidget);
    });
  });
}
