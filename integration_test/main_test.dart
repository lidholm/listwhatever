import 'package:flutter_test/flutter_test.dart';
import 'package:integration_test/integration_test.dart';

import 'package:listanything/main_development.dart' as app;

void main() {
  IntegrationTestWidgetsFlutterBinding.ensureInitialized().framePolicy =
      LiveTestWidgetsFlutterBindingFramePolicy.fullyLive;

  group('end-to-end test', () {
    testWidgets('tap on the floating action button, verify counter',
        (tester) async {
      app.main();
      await tester.pumpAndSettle(const Duration(milliseconds: 1500));

      // print('here');
      // print((find.byType(Text)).evaluate());
      // (find.byType(Text)).evaluate().map(print);
      // print('Done');
      expect(find.text('Sign in with phone'), findsOneWidget);
    });
  });
}
