import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:flutter_ui_base/domain/logic/curved_clippers.dart';

void main() {
  test('ArchClipper returns path', () {
    final clipper = ArchClipper(ArchType.arch);
    final path = clipper.getClip(const Size(100, 100));
    expect(path, isNotNull);
    expect(path.getBounds(), isNotNull);
  });

  test('ArchClipper shouldReclip', () {
    final clipper1 = ArchClipper(ArchType.arch);
    final clipper2 = ArchClipper(ArchType.arch);
    final clipper3 = ArchClipper(ArchType.pyramid);

    expect(clipper1.shouldReclip(clipper2), isFalse);
    expect(clipper1.shouldReclip(clipper3), isTrue);
  });

  test('CurvedTopClipper returns path', () {
    final clipper = CurvedTopClipper(flip: false);
    final path = clipper.getClip(const Size(100, 100));
    expect(path, isNotNull);
  });

  test('CurvedTopClipper shouldReclip', () {
    final clipper1 = CurvedTopClipper(flip: false);
    final clipper2 = CurvedTopClipper(flip: false);
    final clipper3 = CurvedTopClipper(flip: true);

    expect(clipper1.shouldReclip(clipper2), isFalse);
    expect(clipper1.shouldReclip(clipper3), isTrue);
  });
}
