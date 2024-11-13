import 'package:flutter/material.dart';

class FadeInAnimation extends StatefulWidget {
  const FadeInAnimation({super.key, required this.child, required this.delay, required this.direction});
  final Widget child;
  final double delay;
  final String direction;
  @override
  State<FadeInAnimation> createState() => _FadeInAnimationState();
}

class _FadeInAnimationState extends State<FadeInAnimation> with TickerProviderStateMixin {
  late AnimationController controller;
  late Animation<double> animation;
  late Animation<double> animation2;

  @override
  void initState() {
    super.initState();
    controller = AnimationController(duration: Duration(milliseconds: (500 * widget.delay).round()), vsync: this);
    animation2 = Tween<double>(begin: _initialOffset(), end: 0).animate(controller)..addListener(() {setState(() {});});
    animation = Tween<double>(begin: 0, end: 1).animate(controller)..addListener(() {setState(() {});});
  }

  @override
  Widget build(BuildContext context) {
    controller.forward();
    return Transform.translate(
      offset: Offset(_horizontalOffset(), _verticalOffset()),
      child: Opacity(
        opacity: animation.value,
        child: widget.child,
      ),
    );
  }

  double _initialOffset() {
    switch (widget.direction) {
      case 'up':return 40;
      case 'down':return -40;
      case 'right':return -40;
      case 'left':return 40;
      default:return 0;
    }
  }

  double _verticalOffset() {
    if (widget.direction == 'up' || widget.direction == 'down') { return animation2.value; }
    return 0;
  }

  double _horizontalOffset() {
    if (widget.direction == 'left' || widget.direction == 'right') { return animation2.value; }
    return 0;
  }

  @override
  void dispose() {
    controller.dispose();
    super.dispose();
  }
}