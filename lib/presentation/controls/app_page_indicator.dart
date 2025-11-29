import 'package:smooth_page_indicator/smooth_page_indicator.dart';
import 'package:flutter_ui_base/common_libs.dart';

class AppPageIndicator extends StatefulWidget {
  AppPageIndicator({
    super.key,
    required this.count,
    required this.controller,
    this.onDotPressed,
    this.color,
    this.dotSize,
    String? semanticPageTitle,
  }) : semanticPageTitle = semanticPageTitle ?? $strings.page;
  final int count;
  final PageController controller;
  final void Function(int index)? onDotPressed;
  final Color? color;
  final double? dotSize;
  final String semanticPageTitle;

  @override
  State<AppPageIndicator> createState() => _AppPageIndicatorState();
}

class _AppPageIndicatorState extends State<AppPageIndicator> {
  final _currentPage = ValueNotifier(0);

  @override
  void initState() {
    super.initState();
    widget.controller.addListener(_handlePageChanged);
  }

  @override
  void dispose() {
    widget.controller.removeListener(_handlePageChanged);
    _currentPage.dispose();
    super.dispose();
  }

  int get _controllerPage => _currentPage.value;

  void _handlePageChanged() {
    if (widget.controller.hasClients && widget.controller.page != null) {
      _currentPage.value = widget.controller.page!.round();
    }
  }

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Container(
          color: Colors.transparent,
          height: 30,
          alignment: Alignment.center,
          child: ValueListenableBuilder<int>(
            valueListenable: _currentPage,
            builder: (_, value, child) {
              return Semantics(
                liveRegion: true,
                focusable: false,
                readOnly: true,
                label: $strings.appPageSemanticSwipe(
                  widget.semanticPageTitle,
                  (_controllerPage % (widget.count) + 1),
                  widget.count,
                ),
                child: Container(),
              );
            },
          ),
        ),
        Positioned.fill(
          child: Center(
            child: ExcludeSemantics(
              child: SmoothPageIndicator(
                controller: widget.controller,
                count: widget.count,
                onDotClicked: widget.onDotPressed,
                effect: ExpandingDotsEffect(
                  dotWidth: widget.dotSize ?? 6,
                  dotHeight: widget.dotSize ?? 6,
                  paintStyle: PaintingStyle.fill,
                  strokeWidth: (widget.dotSize ?? 6) / 2,
                  dotColor: widget.color ?? $colors.secondaryLight,
                  activeDotColor: widget.color ?? $colors.secondaryLight,
                  expansionFactor: 2,
                ),
              ),
            ),
          ),
        ),
      ],
    );
  }
}
