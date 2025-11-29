import 'package:flutter/material.dart';
import 'package:flutter_core/core/models/bottom_sheet_item.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:flutter_ui_base/domain/logic/show_list_bottom_sheet.dart';
import 'package:flutter_ui_base/presentation/widgets/bottom_sheet/list_bottom_sheet.dart';

void main() {
  testWidgets('showListBottomSheet shows bottom sheet', (
    WidgetTester tester,
  ) async {
    await tester.pumpWidget(
      MaterialApp(
        home: Scaffold(
          body: Builder(
            builder: (context) => TextButton(
              onPressed: () {
                showListBottomSheet(
                  context: context,
                  items: [ListBottomSheetItem(title: 'Option 1')],
                  didSelectOption: (_) {},
                );
              },
              child: const Text('Show'),
            ),
          ),
        ),
      ),
    );

    await tester.tap(find.text('Show'));
    await tester.pumpAndSettle();

    expect(find.byType(ListBottomSheetWidget), findsOneWidget);
    expect(find.text('Option 1'), findsOneWidget);
  });
}
