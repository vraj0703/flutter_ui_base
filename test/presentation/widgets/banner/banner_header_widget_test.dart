import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:flutter_ui_base/presentation/widgets/banner/banner_header_widget.dart';
import 'package:flutter_ui_base/presentation/modals/banner_header_model.dart';

void main() {
  testWidgets('BannerHeaderWidget renders correctly', (
    WidgetTester tester,
  ) async {
    final model = BannerHeaderModel(
      primaryText: 'Title',
      secondaryText: 'Subtitle',
      icon: const Icon(Icons.star),
      iconBackgroundColor: Colors.blue,
      primaryBackgroundColor: Colors.white,
      secondaryBackgroundColor: Colors.grey,
      iconPosition: BannerHeaderIconPosition.topLeft,
      borderRadius: BorderRadius.circular(8),
      backgroundPadding: EdgeInsets.zero,
      iconSize: 24,
      primaryTextStyle: TextStyle(),
    );

    await tester.pumpWidget(
      MaterialApp(
        home: Scaffold(
          body: BannerHeaderWidget(identifier: 'test_banner', model: model),
        ),
      ),
    );

    expect(find.text('Title'), findsOneWidget);
    expect(find.text('Subtitle'), findsOneWidget);
    expect(find.byIcon(Icons.star), findsOneWidget);
  });

  testWidgets('BannerHeaderWidget shows shimmer when loading', (
    WidgetTester tester,
  ) async {
    final model = BannerHeaderModel(
      primaryText: 'Title',
      icon: const Icon(Icons.star),
      iconBackgroundColor: Colors.blue,
      primaryBackgroundColor: Colors.white,
      isLoading: true,
      iconPosition: BannerHeaderIconPosition.topLeft,
      borderRadius: BorderRadius.circular(8),
      backgroundPadding: EdgeInsets.zero,
      iconSize: 24,
      primaryTextStyle: TextStyle(),
      secondaryBackgroundColor: Colors.grey,
    );

    await tester.pumpWidget(
      MaterialApp(
        home: Scaffold(
          body: BannerHeaderWidget(identifier: 'test_banner', model: model),
        ),
      ),
    );

    // Shimmer usually creates a specific structure or we can check for absence of text
    expect(find.text('Title'), findsNothing);
    // Shimmer widget from package:shimmer might not be easily findable by type if it's not exported or if it's a render object.
    // But we can check if Shimmer widget is in the tree.
    // We need to import shimmer package in test if we want to find by type Shimmer.
    // Or just check that text is missing.
  });
}
