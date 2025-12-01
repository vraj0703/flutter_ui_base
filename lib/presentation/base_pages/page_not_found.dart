import 'package:flutter_ui_base/common_libs.dart';
import 'package:flutter_ui_base/presentation/app_logo.dart';
import 'package:flutter_ui_base/presentation/widgets/themed_text.dart';

class PageNotFound extends StatelessWidget {
  final VoidCallback onHomePressed;
  final String logoPath;

  const PageNotFound(
    this.url, {
    super.key,
    required this.onHomePressed,
    required this.logoPath,
  });

  final String url;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: $colors.black,
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            AppLogo(logoPath: logoPath),
            Gap(10),
            Text(
              'Wonderous',
              style: $textStyle.titleFont.copyWith(
                color: $colors.secondaryLight,
                fontSize: 28,
              ),
            ),
            Gap(70),
            Text(
              $strings.pageNotFoundMessage,
              style: $textStyle.bodyMedium.copyWith(color: $colors.offWhite),
            ),
            if (PlatformInfo.isDesktop) ...{
              LightText(child: Text('Path: $url', style: $textStyle.bodySmall)),
            },
            Gap(70),
            AppButton(
              minimumSize: Size(200, 0),
              bgColor: $colors.offWhite,
              onPressed: onHomePressed,
              semanticLabel: 'Back',
              child: DarkText(
                child: Text(
                  $strings.back,
                  style: $textStyle.btn.copyWith(fontSize: 12),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
