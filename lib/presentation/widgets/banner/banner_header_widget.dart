import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:shimmer/shimmer.dart';

import '../../modals/banner_header_model.dart';

class BannerHeaderWidget extends StatelessWidget {
  final BannerHeaderModel model;
  final String identifier;

  const BannerHeaderWidget({
    super.key,
    required this.identifier,
    required this.model,
  });

  @override
  Widget build(BuildContext context) {
    final double bottomPadding =
        model.iconPosition == BannerHeaderIconPosition.topLeft ? 24 : 12;
    return Padding(
      padding: const EdgeInsets.fromLTRB(0, 8, 0, 0),
      child: Stack(
        children: [
          if (model.iconPosition == BannerHeaderIconPosition.topLeft) ...[
            if (model.secondaryBackgroundColor != null)
              Positioned(
                left: 12,
                child: Container(
                  width: (model.iconSize * 2) * 1.6,
                  height: model.iconSize * 2,
                  decoration: BoxDecoration(
                    color: model.secondaryBackgroundColor,
                  ),
                ),
              ),
            Positioned.fill(
              left: 24,
              top: 12,
              child: Container(
                decoration: BoxDecoration(
                  color: model.primaryBackgroundColor,
                  borderRadius: model.borderRadius,
                ),
              ),
            ),
          ],
          if (model.iconPosition == BannerHeaderIconPosition.bottomRight ||
              model.iconPosition == BannerHeaderIconPosition.background) ...[
            if (model.secondaryBackgroundColor != null)
              Positioned(
                right: 12,
                bottom: 12,
                child: Container(
                  width: (model.iconSize * 2) * 1.6,
                  height: model.iconSize * 2,
                  decoration: BoxDecoration(
                    color: model.secondaryBackgroundColor,
                  ),
                ),
              ),
            Positioned.fill(
              left: model.backgroundPadding.left,
              top: model.backgroundPadding.top,
              right: model.backgroundPadding.right,
              bottom: model.backgroundPadding.bottom,
              child: Container(
                decoration: BoxDecoration(
                  color: model.primaryBackgroundColor,
                  borderRadius: model.borderRadius,
                ),
              ),
            ),
            if (model.iconPosition == BannerHeaderIconPosition.background)
              Positioned(
                right: 24,
                bottom: -16,
                child: SizedBox(
                  width: model.iconSize * 2.2,
                  height: model.iconSize * 2.2,
                  child: Container(
                    decoration: BoxDecoration(
                      color: model.iconBackgroundColor,
                      shape: BoxShape.circle,
                    ),
                    padding: const EdgeInsets.all(24.0),
                    child: model.icon,
                  ),
                ),
              ),
          ],
          Padding(
            padding: model.iconPosition == BannerHeaderIconPosition.topLeft
                ? const EdgeInsets.fromLTRB(48, 0, 0, 0)
                : (model.iconPosition == BannerHeaderIconPosition.bottomRight
                      ? const EdgeInsets.fromLTRB(32, 24, 24, 12)
                      : EdgeInsets.fromLTRB(
                          16,
                          24,
                          (32 + (model.iconSize * 2)),
                          16,
                        )),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                if (model.iconPosition == BannerHeaderIconPosition.topLeft) ...[
                  SizedBox(
                    width: 156,
                    height: 156,
                    child: Container(
                      decoration: BoxDecoration(
                        color: model.iconBackgroundColor,
                        shape: BoxShape.circle,
                      ),
                      padding: const EdgeInsets.all(16.0),
                      child: model.icon,
                    ),
                  ),
                  const SizedBox(height: 12.0),
                ],
                if (model.isLoading) ...[
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Shimmer.fromColors(
                      baseColor: model.iconBackgroundColor,
                      highlightColor: model.primaryBackgroundColor.withValues(
                        alpha: 0.5,
                      ),
                      child: Container(
                        width: double.infinity,
                        color: model.iconBackgroundColor,
                        height: 24,
                      ),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Shimmer.fromColors(
                      baseColor: model.iconBackgroundColor,
                      highlightColor: model.primaryBackgroundColor.withValues(
                        alpha: 0.5,
                      ),
                      child: Container(
                        width: MediaQuery.of(context).size.width / 2,
                        color: model.iconBackgroundColor,
                        height: 24,
                      ),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Shimmer.fromColors(
                      baseColor: model.iconBackgroundColor,
                      highlightColor: model.primaryBackgroundColor.withValues(
                        alpha: 0.5,
                      ),
                      child: Container(
                        width: MediaQuery.of(context).size.width / 3,
                        color: model.iconBackgroundColor,
                        height: 24,
                      ),
                    ),
                  ),
                ] else ...[
                  Padding(
                    padding: EdgeInsets.only(
                      left: model.backgroundPadding.left,
                      right: model.backgroundPadding.right,
                      bottom: model.secondaryText == null ? bottomPadding : 0,
                    ),
                    child: SizedBox(
                      width: double.infinity,
                      child: Text(
                        model.primaryText,
                        style: model.primaryTextStyle,
                      ),
                    ),
                  ),
                ],
                if (model.secondaryText != null &&
                    model.secondaryTextStyle != null) ...[
                  const SizedBox(height: 12.0),
                  Padding(
                    padding: EdgeInsets.only(
                      left: model.backgroundPadding.left,
                      right: model.backgroundPadding.right,
                      bottom: bottomPadding,
                    ),
                    child: Text(
                      model.secondaryText!,
                      style: model.secondaryTextStyle!,
                    ),
                  ),
                ],
                if (model.iconPosition ==
                    BannerHeaderIconPosition.bottomRight) ...[
                  Align(
                    alignment: Alignment.bottomRight,
                    child: Padding(
                      padding: const EdgeInsets.fromLTRB(0, 0, 24, 0),
                      child: SizedBox(
                        width: model.iconSize * 2,
                        height: model.iconSize * 2,
                        child: Container(
                          decoration: BoxDecoration(
                            color: model.iconBackgroundColor,
                            shape: BoxShape.circle,
                          ),
                          child: model.icon,
                        ),
                      ),
                    ),
                  ),
                ],
              ],
            ),
          ),
          if (model.closeIcon != null && model.closeAction != null)
            Align(
              alignment: Alignment.topRight,
              child: GestureDetector(
                onTap: model.closeAction,
                child: Padding(
                  padding: const EdgeInsets.fromLTRB(0, 16, 32, 0),
                  child: SizedBox(
                    width: 48,
                    height: 48,
                    child: Align(
                      alignment: Alignment.topRight,
                      child: model.closeIcon!,
                    ),
                  ),
                ),
              ),
            ),
        ],
      ),
    );
  }
}
