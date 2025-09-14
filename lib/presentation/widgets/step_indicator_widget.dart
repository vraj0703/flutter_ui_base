import 'package:flutter/material.dart';

class StepIndicatorWidget extends StatelessWidget {
  final int numberOfSteps;
  final int currentStep;
  final Color fillColor;

  const StepIndicatorWidget({
    super.key,
    required this.numberOfSteps,
    required this.currentStep,
    required this.fillColor,
  });

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
      builder: (context, constraints) {
        var spacing = (numberOfSteps - 1) * 5;
        var width = constraints.maxWidth;
        var barWidth = (width - spacing) / numberOfSteps;
        return Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: _getProgressBarWidget(
                numberOfSteps,
                currentStep,
                barWidth,
                fillColor,
              ),
            ),
          ],
        );
      },
    );
  }
}

List<Widget> _getProgressBarWidget(
  int barCount,
  int currentbar,
  barWidth,
  Color color,
) {
  List<Widget> widgetList = [];
  for (int i = 0; i < barCount; i++) {
    widgetList.add(
      Container(
        height: 6,
        width: barWidth,
        color: i <= currentbar ? color : Colors.black,
      ),
    );
  }
  return widgetList;
}
