import 'package:flutter/material.dart';
import 'package:hydrated_bloc/hydrated_bloc.dart';
import 'package:spotify/common/helpers/common_functions.dart';

class ThemeCubit extends HydratedCubit<ThemeMode> {
  ThemeCubit() : super(ThemeMode.system) {
    debugLog(
      "Theme Cubit is Initialized",
    );
  }

  void updateTheme(ThemeMode mode) {
    debugLog("Update Theme called Theme mode : $mode");
    emit(mode);
  }

  @override
  ThemeMode? fromJson(Map<String, dynamic> json) {
    final theme = ThemeMode.values[json['theme'] as int];
    debugLog("From Json : $theme");
    return theme;
  }

  @override
  Map<String, dynamic>? toJson(ThemeMode state) {
    final theme = {'theme': state.index};
    debugLog("To Json : $theme");
    return theme;
  }
}
