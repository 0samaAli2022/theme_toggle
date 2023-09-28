import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:theme_toggle/state/notifiers/theme_state_notifier.dart';
import 'package:theme_toggle/pages/theme/theme.dart';

final themeProvider = NotifierProvider<ThemeStateNotifier, ThemeData>(ThemeStateNotifier.new);

final isDarkProvider = Provider<bool>((ref) {
  final theme = ref.watch(themeProvider);
  return theme == darkMode;
});
