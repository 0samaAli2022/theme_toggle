import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:theme_toggle/pages/theme/theme.dart';

final sharedPreferencesProvider = FutureProvider<SharedPreferences>((ref) {
  return SharedPreferences.getInstance();
});

class ThemeStateNotifier extends Notifier<ThemeData> {
  SharedPreferences get _prefs =>
      ref.read(sharedPreferencesProvider).requireValue;

  @override
  ThemeData build() {
    final isDark = _prefs.getBool('darkTheme') ?? false;
    final theme = isDark ? darkMode : lightMode;
    return theme;
  }

  Future<void> toggleTheme(bool toDark) async {
    await _prefs.setBool('darkTheme', toDark);
    state = toDark ? darkMode : lightMode;
  }
}
