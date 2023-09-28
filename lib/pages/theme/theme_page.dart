import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:theme_toggle/components/my_drawer.dart';
import 'package:theme_toggle/pages/splash_screen.dart';

class ThemePage extends ConsumerWidget {
  const ThemePage({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: const Text(
          'Toggle Theme',
        ),
      ),
      backgroundColor: Theme.of(context).colorScheme.background,
      body: const SplashScreen(),
      drawer: const MyDrawer()
    );
  }
}
