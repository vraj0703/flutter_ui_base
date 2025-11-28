import 'package:flutter_core/core/enums/icon_position.dart';
import 'package:flutter_core/core/models/bottom_sheet_item.dart';
import 'package:flutter_ui_base/common_libs.dart';

class ListBottomSheetWidget extends StatelessWidget {
  final List<ListBottomSheetItem> items;
  final TextStyle? titleStyle;
  final TextStyle? subTitleStyle;
  final Function(int index) onOptionSelected;

  const ListBottomSheetWidget({
    super.key,
    required this.items,
    required this.onOptionSelected,
    this.titleStyle,
    this.subTitleStyle,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(left: 16, right: 16, top: 12, bottom: 16),
      child: SafeArea(
        child: Wrap(
          children: [
            Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                const SizedBox(height: 16),
                Container(
                  height: 4,
                  width: 40,
                  decoration: BoxDecoration(
                    color: $colors.offWhite,
                    borderRadius: BorderRadius.circular(20),
                  ),
                ),
                const SizedBox(height: 40),
                ListView.builder(
                  shrinkWrap: true,
                  itemBuilder: (BuildContext ctx, int idx) =>
                      _buildListItem(items[idx], idx, context),
                  key: const Key('list_view_bottom_sheet'),
                  itemCount: items.length,
                  physics: const ClampingScrollPhysics(),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildListItem(
    ListBottomSheetItem item,
    int index,
    BuildContext context,
  ) {
    final info = Column(
      mainAxisAlignment: MainAxisAlignment.start,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(item.title, style: titleStyle),
        if (item.subTitle != null) Text(item.subTitle!, style: subTitleStyle),
      ],
    );
    List<Widget> content = [info];
    final iconInfo = item.iconInfo;
    if (iconInfo != null) {
      switch (iconInfo.iconPosition) {
        case IconPosition.left:
          content.insertAll(0, [iconInfo.icon, const SizedBox(width: 8)]);
          break;
        case IconPosition.right:
          content.addAll([const Spacer(), iconInfo.icon]);
          break;
        case IconPosition.top:
        case IconPosition.bottom:
          break;
      }
    }
    return InkWell(
      onTap: () {
        onOptionSelected(index);
        Navigator.of(context).pop();
      },
      child: Padding(
        padding: const EdgeInsets.only(top: 12, bottom: 12),
        child: Row(children: content),
      ),
    );
  }
}
