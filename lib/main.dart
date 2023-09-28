import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:theme_toggle/pages/warm_up.dart';
import 'package:theme_toggle/responsive/desktop_scaffold.dart';
import 'package:theme_toggle/responsive/mobile_scaffold.dart';
import 'package:theme_toggle/responsive/responsive_layout.dart';
import 'package:theme_toggle/responsive/tablet_scaffold.dart';
import 'package:theme_toggle/state/providers/theme_provider.dart';

final GlobalKey<NavigatorState> navigatorKey = GlobalKey<NavigatorState>();

void main() {
  runApp(
    const ProviderScope(
      child: WarmUp(),
    ),
  );
}

class App extends ConsumerWidget {
  const App({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final theme = ref.watch(themeProvider);
    return MaterialApp(
      navigatorKey: navigatorKey,
      theme: theme,
      debugShowCheckedModeBanner: false,
      home: const ResponsiveLayout(
        mobileScaffold: MobileScaffold(),
        tabletScaffold: TabletScaffold(),
        desktopScaffold: DesktopScaffold(),
      ),
    );
  }
}
