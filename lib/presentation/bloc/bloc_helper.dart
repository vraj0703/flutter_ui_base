import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

// This is a helper method to check if a BLoC is present in the provided context
bool isBlocPresent<T extends StateStreamableSource<Object?>>(
    BuildContext context) {
  try {
    BlocProvider.of<T>(context);
    return true;
  } catch (e) {
    // for whatever reason this may be, that means the BLoC is NOT present in the provided context
    return false;
  }
}

// This is a helper method to get a BLoC from the provided context
T? getBloc<T extends StateStreamableSource<Object?>>(BuildContext context) {
  try {
    return BlocProvider.of<T>(context);
  } catch (e) {
    return null;
  }
}
