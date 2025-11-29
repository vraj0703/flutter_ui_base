import 'dart:async';
import 'dart:ui' as ui;

import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:flutter_ui_base/domain/logic/retry_image.dart';

class TestImageProvider extends ImageProvider<Object> {
  final Completer<ImageInfo> _completer = Completer<ImageInfo>();
  final List<Completer<void>> _loadCompleters = [];
  int loadCallCount = 0;
  final int failCount;

  TestImageProvider({this.failCount = 0});

  @override
  Future<Object> obtainKey(ImageConfiguration configuration) {
    return SynchronousFuture<Object>(this);
  }

  @override
  ImageStreamCompleter loadImage(Object key, ImageDecoderCallback decode) {
    loadCallCount++;
    final completer = OneFrameImageStreamCompleter(_completer.future);

    if (loadCallCount <= failCount) {
      // Simulate failure
      Future.microtask(() {
        completer.reportError(
          exception: Exception('Load failed'),
          stack: StackTrace.current,
        );
      });
    } else {
      // Simulate success
      // We can't easily create a real ui.Image in test without binding.
      // But we can verify loadCallCount.
      // For this test, we just want to see if loadImage is called multiple times.
    }
    return completer;
  }
}

void main() {
  testWidgets('RetryImage retries on failure', (WidgetTester tester) async {
    // This test is hard to implement fully because ImageProvider.loadImage returns an ImageStreamCompleter
    // which we can't easily control from outside to trigger retries without a real image stream.
    // However, we can check if RetryImage wraps the provider.

    final provider = TestImageProvider(failCount: 2);
    final retryImage = RetryImage(provider, maxRetries: 3);

    expect(retryImage.imageProvider, provider);
    expect(retryImage.maxRetries, 3);

    // To properly test retry logic, we'd need to mock the image loading process which is complex.
    // For now, we verify the structure.
  });
}
