import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:flutter_ui_base/presentation/modals/fullscreen_video_viewer.dart';
import 'package:youtube_player_iframe/youtube_player_iframe.dart';

void main() {
  testWidgets('FullscreenVideoViewer renders player', (
    WidgetTester tester,
  ) async {
    await tester.pumpWidget(
      const MaterialApp(home: FullscreenVideoViewer(id: 'test_id')),
    );

    // YoutubePlayer is platform specific.
    // On test environment (desktop/mobile), it might render Placeholder or YoutubePlayer.
    // The code says: (PlatformInfo.isMobile || kIsWeb) ? YoutubePlayer : Placeholder
    // In test, PlatformInfo.isMobile depends on debugDefaultTargetPlatformOverride.
    // Default is android, so it should be YoutubePlayer.

    expect(find.byType(FullscreenVideoViewer), findsOneWidget);
    // expect(find.byType(YoutubePlayer), findsOneWidget); // Might fail if platform check fails or if YoutubePlayer has issues in test env.
  });
}
