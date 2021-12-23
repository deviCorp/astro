import 'package:flutter/material.dart';

class SizeAnimation extends StatefulWidget {
  final Widget? child;
  const SizeAnimation({Key? key, this.child});
  @override
  State<StatefulWidget> createState() {
    return SizeAnimationState();
  }
}

class SizeAnimationState extends State<SizeAnimation>
    with SingleTickerProviderStateMixin {
  late AnimationController _controller;
  late Animation<double> _widthAnimation;
  late Animation<double> _heightAnimation;

  @override
  void initState() {
    super.initState();

    _controller = AnimationController(
        duration: const Duration(milliseconds: 1000), vsync: this);

    _widthAnimation = Tween<double>(begin: 0.4, end: 1.0)
        .animate(CurvedAnimation(curve: Curves.easeInOut, parent: _controller));

    _heightAnimation = Tween<double>(begin: 0.0, end: 75.0)
        .animate(CurvedAnimation(curve: Curves.easeInOut, parent: _controller));

    _controller.addListener(() {
      setState(() {});
    });

    _controller.forward();
  }

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: MediaQuery.of(context).size.width * _widthAnimation.value,
      height: _heightAnimation.value,
      child: widget.child,
    );
  }
}
