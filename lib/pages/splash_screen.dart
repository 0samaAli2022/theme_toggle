import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:theme_toggle/components/my_box.dart';
import 'package:theme_toggle/components/my_button.dart';
import 'package:theme_toggle/state/providers/theme_provider.dart';

class SplashScreen extends ConsumerStatefulWidget {
  const SplashScreen({super.key});

  @override
  ConsumerState<ConsumerStatefulWidget> createState() => _SplashScreenState();
}

class _SplashScreenState extends ConsumerState<SplashScreen>
    with TickerProviderStateMixin {
  late AnimationController _controller;
  late Animation<double> _rotationAnimation;
  late Animation<double> _radiusAnimationBig;
  late Animation<double> _radiusAnimationSmall;

  @override
  void initState() {
    super.initState();
    SystemChrome.setEnabledSystemUIMode(SystemUiMode.immersive);
    // animation controller
    _controller = AnimationController(
      vsync: this,
      duration: const Duration(seconds: 2),
    )..forward();
    // rotation animation
    _rotationAnimation = Tween(begin: 0.0, end: 1.0).animate(CurvedAnimation(
      parent: _controller,
      curve: Curves.easeInOut,
    ));
    // radius animation -> from square to circle
    _radiusAnimationBig = Tween(begin: 8.0, end: 100.0).animate(CurvedAnimation(
      parent: _controller,
      curve: Curves.easeInOut,
    ));
    _radiusAnimationSmall =
        Tween(begin: 8.0, end: 50.0).animate(CurvedAnimation(
      parent: _controller,
      curve: Curves.easeInOut,
    ));

    _controller.addListener(() {
      setState(() {});
    });

    // make animation go back and forth
    _controller.addStatusListener((status) {
      if (status == AnimationStatus.completed) {
        _controller.reverse();
      } else if (status == AnimationStatus.dismissed) {
        _controller.forward();
      }
    });
  }

  @override
  void dispose() {
    SystemChrome.setEnabledSystemUIMode(SystemUiMode.manual,
        overlays: SystemUiOverlay.values);
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Transform.rotate(
        angle: _rotationAnimation.value,
        child: MyBox(
          radius: _radiusAnimationBig.value,
          color: Theme.of(context).colorScheme.primary,
          child: Transform.rotate(
            angle: -2 * _rotationAnimation.value,
            child: MyButton(
              radius: _radiusAnimationSmall.value,
              color: Theme.of(context).colorScheme.secondary,
              onTap: () => ref.read(themeProvider.notifier).toggleTheme(!ref.read(isDarkProvider)),
            ),
          ),
        ),
      ),
    );
  }
}
