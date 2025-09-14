import 'package:flutter/material.dart';
import 'package:flutter_core/domain/models/list_bottom_sheet_item.dart';
import 'package:flutter_ui_base/presentation/widgets/bottom_sheet/list_bottom_sheet.dart';

Future<T?> showListBottomSheet<T>({
  required BuildContext context,
  required List<ListBottomSheetItem> items,
  required Function(int index) didSelectOption,
  TextStyle? titleStyle,
  TextStyle? subTitleStyle,
  String? disclaimer,
  VoidCallback? onClose,
}) {
  return showModalBottomSheet(
    context: context,
    builder: (_) {
      return ConstrainedBox(
        constraints: BoxConstraints(
          maxHeight: MediaQuery.of(context).size.height * 0.92,
        ),
        child: ListView(
          shrinkWrap: true,
          children: [
            ListBottomSheetWidget(
              items: items,
              onOptionSelected: didSelectOption,
              titleStyle: titleStyle,
              subTitleStyle: subTitleStyle,
            ),
            if (disclaimer != null)
              Center(
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Text(
                    disclaimer,
                    style: Theme.of(context).textTheme.titleSmall,
                  ),
                ),
              ),
          ],
        ),
      );
    },
    shape: const RoundedRectangleBorder(
      borderRadius: BorderRadius.vertical(top: Radius.circular(16)),
    ),
    backgroundColor: Colors.white,
  ).then((_) {
    onClose?.call();
    return null;
  });
}
