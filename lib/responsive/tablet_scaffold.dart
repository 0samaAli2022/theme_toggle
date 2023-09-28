import 'package:flutter/material.dart';
import 'package:theme_toggle/components/my_drawer.dart';
import 'package:theme_toggle/pages/home_page.dart';

class TabletScaffold extends StatelessWidget {
  const TabletScaffold({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Text('Home Page'),
          centerTitle: true,
        ),
        body: const Column(
          children: [
            Expanded(
              child: Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  Expanded(flex: 2,child: MyDrawer(),),
                  Expanded(flex: 3,child: HomePage(),),
                ],
              ),
            ),
          ],
        ));
  }
}
