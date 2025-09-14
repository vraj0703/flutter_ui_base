// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'conditioned_widget.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

/// @nodoc
mixin _$Conditioned {
  bool get condition => throw _privateConstructorUsedError;
  WidgetBuilder get widget => throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(bool condition, WidgetBuilder widget) widget,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(bool condition, WidgetBuilder widget)? widget,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(bool condition, WidgetBuilder widget)? widget,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_Widget value) widget,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_Widget value)? widget,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Widget value)? widget,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $ConditionedCopyWith<Conditioned> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $ConditionedCopyWith<$Res> {
  factory $ConditionedCopyWith(
          Conditioned value, $Res Function(Conditioned) then) =
      _$ConditionedCopyWithImpl<$Res, Conditioned>;
  @useResult
  $Res call({bool condition, WidgetBuilder widget});
}

/// @nodoc
class _$ConditionedCopyWithImpl<$Res, $Val extends Conditioned>
    implements $ConditionedCopyWith<$Res> {
  _$ConditionedCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? condition = null,
    Object? widget = null,
  }) {
    return _then(_value.copyWith(
      condition: null == condition
          ? _value.condition
          : condition // ignore: cast_nullable_to_non_nullable
              as bool,
      widget: null == widget
          ? _value.widget
          : widget // ignore: cast_nullable_to_non_nullable
              as WidgetBuilder,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$WidgetImplCopyWith<$Res>
    implements $ConditionedCopyWith<$Res> {
  factory _$$WidgetImplCopyWith(
          _$WidgetImpl value, $Res Function(_$WidgetImpl) then) =
      __$$WidgetImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({bool condition, WidgetBuilder widget});
}

/// @nodoc
class __$$WidgetImplCopyWithImpl<$Res>
    extends _$ConditionedCopyWithImpl<$Res, _$WidgetImpl>
    implements _$$WidgetImplCopyWith<$Res> {
  __$$WidgetImplCopyWithImpl(
      _$WidgetImpl _value, $Res Function(_$WidgetImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? condition = null,
    Object? widget = null,
  }) {
    return _then(_$WidgetImpl(
      null == condition
          ? _value.condition
          : condition // ignore: cast_nullable_to_non_nullable
              as bool,
      null == widget
          ? _value.widget
          : widget // ignore: cast_nullable_to_non_nullable
              as WidgetBuilder,
    ));
  }
}

/// @nodoc

class _$WidgetImpl implements _Widget {
  _$WidgetImpl(this.condition, this.widget);

  @override
  final bool condition;
  @override
  final WidgetBuilder widget;

  @override
  String toString() {
    return 'Conditioned.widget(condition: $condition, widget: $widget)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$WidgetImpl &&
            (identical(other.condition, condition) ||
                other.condition == condition) &&
            (identical(other.widget, widget) || other.widget == widget));
  }

  @override
  int get hashCode => Object.hash(runtimeType, condition, widget);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$WidgetImplCopyWith<_$WidgetImpl> get copyWith =>
      __$$WidgetImplCopyWithImpl<_$WidgetImpl>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(bool condition, WidgetBuilder widget) widget,
  }) {
    return widget(condition, this.widget);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(bool condition, WidgetBuilder widget)? widget,
  }) {
    return widget?.call(condition, this.widget);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(bool condition, WidgetBuilder widget)? widget,
    required TResult orElse(),
  }) {
    if (widget != null) {
      return widget(condition, this.widget);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_Widget value) widget,
  }) {
    return widget(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_Widget value)? widget,
  }) {
    return widget?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Widget value)? widget,
    required TResult orElse(),
  }) {
    if (widget != null) {
      return widget(this);
    }
    return orElse();
  }
}

abstract class _Widget implements Conditioned {
  factory _Widget(final bool condition, final WidgetBuilder widget) =
      _$WidgetImpl;

  @override
  bool get condition;
  @override
  WidgetBuilder get widget;
  @override
  @JsonKey(ignore: true)
  _$$WidgetImplCopyWith<_$WidgetImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
