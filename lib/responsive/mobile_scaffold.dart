import 'package:flutter/material.dart';
import 'package:theme_toggle/components/my_drawer.dart';
import 'package:theme_toggle/pages/home_page.dart';

class MobileScaffold extends StatelessWidget {
  const MobileScaffold({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Home Page'),
        centerTitle: true,
      ),
      body: const HomePage(),
      drawer: const MyDrawer(),
    );
  }
}
