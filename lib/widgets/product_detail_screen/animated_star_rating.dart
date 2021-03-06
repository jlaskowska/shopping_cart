import 'package:art_store/widgets/product_detail_screen/star_rating.dart';
import 'package:flutter/material.dart';

class AnimatedStarRating extends StatefulWidget {
  final double prodcutRating;

  AnimatedStarRating({
    Key key,
    @required this.prodcutRating,
  }) : super(key: key);

  @override
  _AnimatedStarRatingState createState() => _AnimatedStarRatingState();
}

class _AnimatedStarRatingState extends State<AnimatedStarRating> with SingleTickerProviderStateMixin {
  AnimationController _controller;
  double currentValue = 0;

  @override
  void initState() {
    super.initState();

    _controller = AnimationController(vsync: this);
  }

  @override
  Widget build(BuildContext context) {
    _controller.duration = const Duration(milliseconds: 500);

    _controller.reset();
    Animation _animation = Tween<double>(begin: currentValue, end: widget.prodcutRating).animate(_controller);
    _animation.addStatusListener((status) {
      if (status == AnimationStatus.completed) {
        currentValue = widget.prodcutRating;
      }
    });
    _controller.forward();

    return AnimatedBuilder(
      animation: _animation,
      builder: (_, __) => StarRating(
        productRating: _animation.value,
      ),
    );
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }
}
