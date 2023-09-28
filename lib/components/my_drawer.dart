import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:theme_toggle/state/providers/theme_provider.dart';

class MyDrawer extends ConsumerWidget {
  const MyDrawer({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    var isDark = ref.watch(isDarkProvider);
    return Drawer(
      child: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(12.0),
          child: SingleChildScrollView(
            child: Column(
              children: [
                const SizedBox(
                  height: 15,
                ),
                const CircleAvatar(
                  backgroundImage: AssetImage(
                    'assets/1.jpg',
                  ),
                  radius: 40,
                  backgroundColor: Colors.grey,
                )
                    .animate()
                    .slideX(duration: 1000.ms, curve: Curves.easeInOut)
                    .fadeIn(),
                const SizedBox(
                  height: 10,
                ),
                const Text(
                  'Osama Ali',
                  style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                )
                    .animate()
                    .slideX(duration: 1000.ms, curve: Curves.easeInOut)
                    .fadeIn(),
                Padding(
                  padding: const EdgeInsets.only(top: 15),
                  child: Divider(
                    thickness: 1,
                  ),
                ),
                ListTile(
                  leading: const Icon(Icons.dark_mode),
                  title: const Text('Theme Color'),
                  horizontalTitleGap: -3,
                  trailing: Switch(
                    value: isDark,
                    onChanged: (value) async {
                      ref.read(themeProvider.notifier).toggleTheme(!isDark);
                    },
                  ),
                ),
                const ListTile(
                  leading: Icon(Icons.home),
                  title: Text('Home Page'),
                  horizontalTitleGap: -3,
                ),
                const ListTile(
                  leading: Icon(Icons.person),
                  title: Text('My Profile'),
                  horizontalTitleGap: -3,
                ),
                const ListTile(
                  leading: Icon(Icons.settings),
                  title: Text('Settings'),
                  horizontalTitleGap: -3,
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
