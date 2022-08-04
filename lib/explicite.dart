import 'dart:math';

import 'package:flutter/material.dart';

class ExpliciteAnimation extends StatefulWidget {
  const ExpliciteAnimation({Key? key}) : super(key: key);

  @override
  State<ExpliciteAnimation> createState() => _ExpliciteAnimationState();
}

class _ExpliciteAnimationState extends State<ExpliciteAnimation>
    with SingleTickerProviderStateMixin {
  late AnimationController _animationController;
  // late Animation _animation;
  late Animation _scaleAnimation;
  late Animation _rotateAnimation;

  @override
  void initState() {
    super.initState();

    _animationController =
        AnimationController(vsync: this, duration: const Duration(seconds: 2));

    // _animation =
    //     CurvedAnimation(parent: _animationController, curve: Curves.easeInOut);

    _scaleAnimation = CurvedAnimation(
        parent: _animationController,
        curve: const Interval(0.0, 0.5, curve: Curves.easeOutCubic));

    _rotateAnimation = Tween<double>(begin: 0.0, end: 2 * pi).animate(
      CurvedAnimation(
        parent: _animationController,
        curve: Interval(0.5, 1.0),
      ),
    );

    _animationController.addListener(() => setState(() {}));
    _animationController.repeat(reverse: true);
  }

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Transform.rotate(
        angle: _rotateAnimation.value,
        child: Transform.scale(
          scale: _scaleAnimation.value,
          child: Container(
            width: 50.0,
            height: 50.0,
            color: Colors.blueGrey,
          ),
        ),
      ),
    );
  }

  @override
  void dispose() {
    _animationController.dispose();
    super.dispose();
  }
}
