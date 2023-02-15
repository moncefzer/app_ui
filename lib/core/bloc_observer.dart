// ignore_for_file: avoid_print

import 'package:flutter/foundation.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

void blocPrint(x) {
  debugPrint('--' * 20);
  debugPrint(x);
  debugPrint('--' * 20);
}

class MyBlocObserver extends BlocObserver {
  @override
  void onCreate(BlocBase bloc) {
    super.onCreate(bloc);
    blocPrint('onCreate -- ${bloc.runtimeType}');
  }

  @override
  void onChange(BlocBase bloc, Change change) {
    super.onChange(bloc, change);
    blocPrint('onChange -- ${bloc.runtimeType}, $change');
  }

  @override
  void onError(BlocBase bloc, Object error, StackTrace stackTrace) {
    blocPrint('onError -- ${bloc.runtimeType}, $error');
    super.onError(bloc, error, stackTrace);
  }

  @override
  void onClose(BlocBase bloc) {
    super.onClose(bloc);
    blocPrint('onClose -- ${bloc.runtimeType}');
  }
}
