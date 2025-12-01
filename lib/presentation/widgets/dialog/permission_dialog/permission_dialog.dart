import 'package:flutter_ui_base/common_libs.dart';
import 'package:my_theme_style/styles/app_icon.dart';
import 'model.dart';

class PermissionDialog extends StatelessWidget {
  final PermissionsDialogModel model;

  const PermissionDialog({super.key, required this.model});

  @override
  Widget build(BuildContext context) {
    return Dialog(
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
      backgroundColor: $colors.white,
      child: Padding(
        padding: EdgeInsets.all($insets.xl),
        child: SingleChildScrollView(
          child: Column(
            mainAxisSize: MainAxisSize.min,
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: List.generate(model.icons.length, (index) {
                  return Row(
                    children: [
                      AppIcon(
                        model.icons[index],
                        size: $sizes.iconXl,
                        color: $colors.blue,
                      ),
                      // Only add spacer if it's not the last item
                      if (index < model.icons.length - 1)
                        SizedBox(width: $insets.sm),
                    ],
                  );
                }),
              ),
              SizedBox(height: $insets.sm),
              Text(
                model.title,
                textAlign: TextAlign.left,
                style: $textStyle.displayLarge.copyWith(color: $colors.blue),
              ),
              SizedBox(height: $insets.md),
              Text(
                model.description,
                textAlign: TextAlign.left,
                style: $textStyle.bodyLarge,
              ),
              SizedBox(height: $insets.md),
              Align(
                alignment: Alignment.topLeft,
                child: Wrap(
                  spacing: $insets.sm,
                  runSpacing: $insets.sm,
                  children: [
                    AppButton(
                      key: UniqueKey(),
                      onPressed: model.onAllowed,
                      semanticLabel: "cameraPermissionAllowButton",
                      child: Text($strings.ok),
                    ),
                    AppButton(
                      key: UniqueKey(),
                      semanticLabel: "cameraPermissionDenyButton",
                      onPressed: model.onDenied,
                      child: Text($strings.cancel),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
