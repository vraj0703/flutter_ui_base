import 'package:flutter_test/flutter_test.dart';
import 'package:flutter_ui_base/common_libs.dart';
import 'package:flutter_ui_base/presentation/widgets/gradient/gradient_icon.dart';

void main() {
  testWidgets('GradientIcon renders', (WidgetTester tester) async {
    await tester.pumpWidget(
      const MaterialApp(
        home: Scaffold(
          body: GradientIcon(
            icon: AppIcons.camera,
            size: 50,
            gradient: LinearGradient(colors: [Colors.red, Colors.blue]),
          ),
        ),
      ),
    );

    expect(find.byType(ShaderMask), findsOneWidget);
    expect(find.byIcon(AppIcons.icon(AppIcons.camera)), findsOneWidget);
  });
}
