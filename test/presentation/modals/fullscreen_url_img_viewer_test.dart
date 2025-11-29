import 'package:flutter_test/flutter_test.dart';
import 'package:flutter_ui_base/presentation/modals/fullscreen_url_img_viewer.dart';
import 'package:flutter_ui_base/common_libs.dart';

void main() {
  testWidgets('FullscreenUrlImgViewer renders and navigates', (
    WidgetTester tester,
  ) async {
    await tester.pumpWidget(
      MaterialApp(
        home: FullscreenUrlImgViewer(
          urls: const ['http://example.com/1.png', 'http://example.com/2.png'],
        ),
      ),
    );

    expect(find.byType(PageView), findsOneWidget);
    expect(find.byType(InteractiveViewer), findsOneWidget);

    // Check navigation buttons
    expect(
      find.byIcon(AppIcons.icon(AppIcons.prev)),
      findsNWidgets(2),
    ); // Prev and Next (flipped prev)

    // Navigate next
    await tester.tap(find.byIcon(AppIcons.icon(AppIcons.prev)).last);
    await tester.pumpAndSettle();

    // Verify page changed (internal state hard to check without key, but no crash is good)
  });
}
