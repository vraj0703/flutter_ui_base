import 'package:collection/collection.dart';
import 'package:flutter/material.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'conditioned_widget.freezed.dart';

@freezed
class Conditioned with _$Conditioned {
  factory Conditioned.widget(bool condition, WidgetBuilder widget) = _Widget;
}

class ConditionedWidget extends StatelessWidget {
  final List<Conditioned> conditioned;
  final WidgetBuilder defaultChild;

  const ConditionedWidget({
    super.key,
    required this.conditioned,
    required this.defaultChild,
  });

  @override
  Widget build(BuildContext context) {
    return conditioned
            .firstWhereOrNull((element) => element.condition)
            ?.widget
            .call(context) ??
        defaultChild.call(context);
  }
}
