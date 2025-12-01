import 'package:flutter_ui_base/common_libs.dart';

class AppSnackBarAlert {
  static SnackBar makeSnackBarToastWidget(
    BuildContext context, {
    required String title,
    required String message,
  }) {
    return SnackBar(
      behavior: SnackBarBehavior.floating,
      margin: EdgeInsets.all($insets.sm),
      content: SizedBox(
        height: $sizes.snackbarHeight,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Align(
              alignment: Alignment.topLeft,
              child: Text(title, style: $textStyle.titleMedium),
            ),
            SizedBox(height: $insets.sm),
            Text(message),
          ],
        ),
      ),
    );
  }
}
