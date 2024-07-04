import 'package:flutter/material.dart';
import 'package:hydrated_bloc/hydrated_bloc.dart';
import 'package:spotify/common/common_functions.dart';

class ThemeCubit extends HydratedCubit<ThemeMode> {
  ThemeCubit() : super(ThemeMode.system) {
    debugLog("Theme Cubit is Initialized", name: "Theme Cubit");
  }

  void updateTheme() => emit(ThemeMode.system);
  @override
  ThemeMode? fromJson(Map<String, dynamic> json) {
    // TODO: implement fromJson
    throw UnimplementedError();
  }

  @override
  Map<String, dynamic>? toJson(ThemeMode state) {
    // TODO: implement toJson
    throw UnimplementedError();
  }
}
