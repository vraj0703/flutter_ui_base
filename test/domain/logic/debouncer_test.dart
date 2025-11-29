import 'package:flutter_test/flutter_test.dart';
import 'package:flutter_ui_base/domain/logic/debouncer.dart';

void main() {
  test('Debouncer calls action after delay', () async {
    final debouncer = Debouncer(const Duration(milliseconds: 100));
    bool called = false;

    debouncer(() => called = true);

    expect(called, isFalse);

    await Future.delayed(const Duration(milliseconds: 150));

    expect(called, isTrue);
  });

  test('Debouncer cancels previous action', () async {
    final debouncer = Debouncer(const Duration(milliseconds: 100));
    int callCount = 0;

    debouncer(() => callCount++);
    debouncer(() => callCount++);

    await Future.delayed(const Duration(milliseconds: 150));

    expect(callCount, 1);
  });

  test('Debouncer reset cancels timer', () async {
    final debouncer = Debouncer(const Duration(milliseconds: 100));
    bool called = false;

    debouncer(() => called = true);
    debouncer.reset();

    await Future.delayed(const Duration(milliseconds: 150));

    expect(called, isFalse);
  });
}
