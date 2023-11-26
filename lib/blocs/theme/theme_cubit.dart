import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

part 'theme_state.dart';

class ThemeCubit extends Cubit<ThemeState> {
  ThemeCubit()
      : super(
          const ThemeState(ThemeMode.light),
        );

  void switchTheme() {
    if (state.themeMode == ThemeMode.dark) {
      emit(
        state.copyWith(
          themeMode: ThemeMode.light,
        ),
      );
    } else if (state.themeMode == ThemeMode.light) {
      emit(
        state.copyWith(
          themeMode: ThemeMode.dark,
        ),
      );
    }
  }
}
