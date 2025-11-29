import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:flutter_ui_base/presentation/bloc/bloc_helper.dart';

class TestBloc extends Cubit<int> {
  TestBloc() : super(0);
}

void main() {
  testWidgets('isBlocPresent returns true when Bloc is present', (
    WidgetTester tester,
  ) async {
    bool present = false;

    await tester.pumpWidget(
      BlocProvider(
        create: (_) => TestBloc(),
        child: Builder(
          builder: (context) {
            present = isBlocPresent<TestBloc>(context);
            return Container();
          },
        ),
      ),
    );

    expect(present, isTrue);
  });

  testWidgets('isBlocPresent returns false when Bloc is missing', (
    WidgetTester tester,
  ) async {
    bool present = true;

    await tester.pumpWidget(
      Builder(
        builder: (context) {
          present = isBlocPresent<TestBloc>(context);
          return Container();
        },
      ),
    );

    expect(present, isFalse);
  });

  testWidgets('getBloc returns Bloc when present', (WidgetTester tester) async {
    TestBloc? bloc;

    await tester.pumpWidget(
      BlocProvider(
        create: (_) => TestBloc(),
        child: Builder(
          builder: (context) {
            bloc = getBloc<TestBloc>(context);
            return Container();
          },
        ),
      ),
    );

    expect(bloc, isNotNull);
    expect(bloc, isA<TestBloc>());
  });

  testWidgets('getBloc returns null when Bloc is missing', (
    WidgetTester tester,
  ) async {
    TestBloc? bloc;

    await tester.pumpWidget(
      Builder(
        builder: (context) {
          bloc = getBloc<TestBloc>(context);
          return Container();
        },
      ),
    );

    expect(bloc, isNull);
  });
}
