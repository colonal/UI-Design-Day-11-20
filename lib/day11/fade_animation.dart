import 'package:flutter/material.dart';

class FadeAnimation extends StatefulWidget {
  final Widget child;

  const FadeAnimation({required this.child, Key? key}) : super(key: key);

  @override
  _FadeAnimationState createState() => _FadeAnimationState();
}

class _FadeAnimationState extends State<FadeAnimation>
    with SingleTickerProviderStateMixin {
  late AnimationController controller;
  late Animation<Offset> offset;

  @override
  void initState() {
    super.initState();

    controller =
        AnimationController(vsync: this, duration: const Duration(seconds: 1));

    offset = Tween<Offset>(
      begin: const Offset(0.0, -0.3),
      end: Offset.zero,
    ).animate(controller);

    controller.forward();
  }

  @override
  Widget build(BuildContext context) {
    return Align(
      alignment: Alignment.bottomCenter,
      child: SlideTransition(
        position: offset,
        child: OpacityAnimation(child: widget.child),
      ),
    );
  }
}

class OpacityAnimation extends StatefulWidget {
  const OpacityAnimation({required this.child, Key? key}) : super(key: key);
  final Widget child;
  @override
  _OpacityAnimationState createState() => _OpacityAnimationState();
}

class _OpacityAnimationState extends State<OpacityAnimation>
    with SingleTickerProviderStateMixin {
  late Animation<double> animationOpacity;
  late AnimationController controllerOpacity;

  @override
  void initState() {
    controllerOpacity =
        AnimationController(vsync: this, duration: const Duration(seconds: 1));
    animationOpacity = Tween<double>(
      begin: 0,
      end: 1,
    ).animate(controllerOpacity);
    animationOpacity.addListener(() {
      setState(() {});
      if (animationOpacity.value > 0.95) controllerOpacity.stop();
    });

    controllerOpacity.forward();
    super.initState();
  }

  @override
  void dispose() {
    controllerOpacity.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Opacity(
      opacity: animationOpacity.value,
      child: widget.child,
    );
  }
}
