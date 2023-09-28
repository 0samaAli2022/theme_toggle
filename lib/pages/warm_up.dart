import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:theme_toggle/main.dart' show App;
import 'package:theme_toggle/state/notifiers/theme_state_notifier.dart';

class WarmUp extends ConsumerStatefulWidget {
  const WarmUp({super.key});

  @override
  ConsumerState<ConsumerStatefulWidget> createState() => _WarmUpState();
}

final warmupProvider = StateProvider<bool>((ref) => false);

class _WarmUpState extends ConsumerState<WarmUp> {
  @override
  Widget build(BuildContext context) {
    final warmedUp = ref.watch(warmupProvider);
    if (warmedUp) return const App();
    final providers = <ProviderListenable<AsyncValue<Object?>>>[
      sharedPreferencesProvider
    ];
    final states = providers.map(ref.watch).toList();
    for (final state in states) {
      if (state is AsyncError) {
        Error.throwWithStackTrace(state.error, state.stackTrace);
      }
    }
    if (states.every((state) => state is AsyncData)) {
      Future(
          () => setState(() => ref.read(warmupProvider.notifier).state = true));
    }
    return Container(color: Colors.white);
  }
}