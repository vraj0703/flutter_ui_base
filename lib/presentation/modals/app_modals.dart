import 'package:flutter_ui_base/common_libs.dart';
import 'package:flutter_ui_base/presentation/widgets/themed_text.dart';

Future<bool?> showModal(BuildContext context, {required Widget child}) async {
  return await showModalBottomSheet(
        context: context,
        backgroundColor: $colors.greyDark,
        builder: (_) => child,
      ) ??
      false;
}

class LoadingModal extends StatelessWidget {
  const LoadingModal({super.key, this.title, this.msg, this.child});

  final String? title;
  final String? msg;
  final Widget? child;

  @override
  Widget build(BuildContext context) {
    return _BaseContentModal(
      title: title,
      msg: msg,
      buttons: const [],
      child: child,
    );
  }
}

class OkModal extends StatelessWidget {
  const OkModal({super.key, this.title, this.msg, this.child});

  final String? title;
  final String? msg;
  final Widget? child;

  @override
  Widget build(BuildContext context) {
    return _BaseContentModal(
      title: title,
      msg: msg,
      buttons: [
        AppButton.from(
          text: $strings.ok,
          expand: true,
          isSecondary: true,
          onPressed: () => Navigator.of(context).pop(true),
        ),
      ],
      child: child,
    );
  }
}

class OkCancelModal extends StatelessWidget {
  const OkCancelModal({super.key, this.title, this.msg, this.child});

  final String? title;
  final String? msg;
  final Widget? child;

  @override
  Widget build(BuildContext context) {
    return _BaseContentModal(
      title: title,
      msg: msg,
      buttons: [
        AppButton.from(
          text: $strings.ok,
          expand: true,
          isSecondary: true,
          onPressed: () => Navigator.of(context).pop(true),
        ),
        Gap($insets.xs),
        AppButton.from(
          text: $strings.cancel,
          expand: true,
          onPressed: () => Navigator.of(context).pop(false),
        ),
      ],
      child: child,
    );
  }
}

/// Allows for a title, msg and body widget
class _BaseContentModal extends StatelessWidget {
  final String? title;
  final String? msg;
  final Widget? child;
  final List<Widget> buttons;

  const _BaseContentModal({
    this.title,
    this.msg,
    required this.buttons,
    this.child,
  });

  @override
  Widget build(BuildContext context) {
    return IntrinsicHeight(
      child: Center(
        child: SizedBox(
          width: $sizes.maxContentWidth3,
          child: Padding(
            padding: EdgeInsets.all($insets.lg),
            child: LightText(
              child: SeparatedColumn(
                mainAxisSize: MainAxisSize.min,
                separatorBuilder: () => Gap($insets.md),
                children: [
                  if (title != null)
                    Text(title!, style: $textStyle.headlineMedium),
                  if (child != null) child!,
                  if (msg != null) Text(msg!, style: $textStyle.bodyMedium),
                  Gap($insets.md),
                  Column(children: buttons.map((e) => e).toList()),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
