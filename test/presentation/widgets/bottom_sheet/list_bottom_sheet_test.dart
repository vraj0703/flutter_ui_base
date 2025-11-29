import 'package:flutter/material.dart';
import 'package:flutter_core/core/enums/icon_position.dart';
import 'package:flutter_core/core/models/bottom_sheet_item.dart';
import 'package:flutter_core/core/models/icon_with_position.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:flutter_ui_base/presentation/widgets/bottom_sheet/list_bottom_sheet.dart';

void main() {
  testWidgets('ListBottomSheetWidget renders items and handles tap', (
    WidgetTester tester,
  ) async {
    int? selectedIndex;

    final items = [
      ListBottomSheetItem(
        title: 'Item 1',
        subTitle: 'Subtitle 1',
        iconInfo: ItemIconWithPosition(
          icon: const Icon(Icons.star),
          iconPosition: IconPosition.left,
        ),
      ),
      ListBottomSheetItem(
        title: 'Item 2',
        iconInfo: ItemIconWithPosition(
          icon: const Icon(Icons.circle),
          iconPosition: IconPosition.right,
        ),
      ),
    ];

    await tester.pumpWidget(
      MaterialApp(
        home: Scaffold(
          body: Builder(
            builder: (context) => TextButton(
              onPressed: () {
                showModalBottomSheet(
                  context: context,
                  builder: (_) => ListBottomSheetWidget(
                    items: items,
                    onOptionSelected: (index) => selectedIndex = index,
                  ),
                );
              },
              child: const Text('Open'),
            ),
          ),
        ),
      ),
    );

    // Open bottom sheet
    await tester.tap(find.text('Open'));
    await tester.pumpAndSettle();

    expect(find.text('Item 1'), findsOneWidget);
    expect(find.text('Subtitle 1'), findsOneWidget);
    expect(find.byIcon(Icons.star), findsOneWidget);
    expect(find.byIcon(Icons.circle), findsOneWidget);

    // Tap Item 1
    await tester.tap(find.text('Item 1'));
    await tester.pumpAndSettle();

    expect(selectedIndex, 0);
    expect(find.text('Item 1'), findsNothing); // Sheet closed
  });
}
