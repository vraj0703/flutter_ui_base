import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:flutter_ui_base/presentation/modals/banner_header_model.dart';

void main() {
  test('BannerHeaderModel stores values correctly', () {
    final model = BannerHeaderModel(
      icon: const Icon(Icons.abc),
      iconPosition: BannerHeaderIconPosition.topLeft,
      primaryText: 'Primary',
      secondaryText: 'Secondary',
      primaryBackgroundColor: Colors.red,
      secondaryBackgroundColor: Colors.blue,
      iconBackgroundColor: Colors.green,
      primaryTextStyle: const TextStyle(fontSize: 10),
      secondaryTextStyle: const TextStyle(fontSize: 8),
      iconSize: 24,
      borderRadius: BorderRadius.circular(8),
      backgroundPadding: const EdgeInsets.all(8),
      isLoading: true,
    );

    expect(model.primaryText, 'Primary');
    expect(model.secondaryText, 'Secondary');
    expect(model.iconPosition, BannerHeaderIconPosition.topLeft);
    expect(model.isLoading, isTrue);
  });
}
