library flutter_star_raiting;

import 'package:flutter/material.dart';

typedef void RatingTapCallback(double rating);

class StarRating extends StatelessWidget {
  final int length;
  final double rating;
  final double between;
  final double starSize;
  final RatingTapCallback onRaitingTap;
  final Color color;
  final MainAxisAlignment mainAxisAlignment;
  final CrossAxisAlignment crossAxisAlignment;

  final Icon _full, _half, _empty;

  StarRating({
    this.length: 1,
    this.rating: 0,
    this.between: 0.0,
    this.starSize: 20.0,
    this.color: Colors.blueAccent,
    this.onRaitingTap,
    this.mainAxisAlignment,
    this.crossAxisAlignment = CrossAxisAlignment.center,
  })  : _full = Icon(Icons.star, color: color, size: starSize),
        _half = Icon(Icons.star_half, color: color, size: starSize),
        _empty = Icon(Icons.star_border, color: color, size: starSize);

  @override
  Widget build(BuildContext context) {
    List<Widget> stars = List(2 * length - 1);
    final SizedBox space = SizedBox(width: between);

    for (int i = 0; i < length; i++) {
      if (i > 0) {
        stars[2 * i - 1] = space;
      }
      stars[2 * i] = GestureDetector(
        onTap: () {
          onRaitingTap((i + 1).toDouble());
        },
        child: chooseStar(i),
      );
    }

    return Row(
      mainAxisAlignment: mainAxisAlignment,
      crossAxisAlignment: crossAxisAlignment,
      children: stars,
    );
  }

  Icon chooseStar(int index) =>
      (rating >= index + 1) ? _full : (rating >= index + 0.5) ? _half : _empty;
}
