import 'package:flutter/material.dart';
import 'package:flutter_map/flutter_map.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:flutter_ui_base/presentation/widgets/maps/app_map.dart';

void main() {
  testWidgets('AppMap renders', (WidgetTester tester) async {
    await tester.pumpWidget(
      const MaterialApp(
        home: Scaffold(
          body: AppMap(
            baseUrl: 'https://tile.openstreetmap.org/{z}/{x}/{y}.png',
            lat: 51.5,
            long: -0.09,
          ),
        ),
      ),
    );

    expect(find.byType(FlutterMap), findsOneWidget);
    // TileLayer might be deeper in the tree or not easily findable by type if it's not a widget but a layer.
    // In flutter_map v6+, TileLayer is a widget.
    expect(find.byType(TileLayer), findsOneWidget);
  });
}
