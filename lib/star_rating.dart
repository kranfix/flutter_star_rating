library flutter_star_raiting;

import 'package:flutter/material.dart';

typedef RatingTapCallback = void Function(double rating);

class StarRating extends StatelessWidget {
  StarRating({
    this.length: 1,
    this.rating: 0,
    this.between: 0.0,
    this.starSize: 20.0,
    this.color: Colors.blueAccent,
    this.onRaitingTap,
    this.mainAxisAlignment = MainAxisAlignment.start,
    this.crossAxisAlignment = CrossAxisAlignment.center,
  });

  final int length;
  final double rating;
  final double between;
  final double starSize;
  final RatingTapCallback? onRaitingTap;
  final Color color;
  final MainAxisAlignment mainAxisAlignment;
  final CrossAxisAlignment crossAxisAlignment;

  @override
  Widget build(BuildContext context) {
    final SizedBox space = SizedBox(width: between);

    final _full = Icon(Icons.star, color: color, size: starSize);
    final _half = Icon(Icons.star, color: color, size: starSize);
    final _empty = Icon(Icons.star_border, color: color, size: starSize);

    Icon chooseStar(int index) => (rating >= index + 1)
        ? _full
        : (rating >= index + 0.5)
            ? _half
            : _empty;

    return Row(
      mainAxisAlignment: mainAxisAlignment,
      crossAxisAlignment: crossAxisAlignment,
      children: <Widget>[
        for (int i = 0; i < length; i++) ...[
          if (i > 0) space,
          GestureDetector(
            onTap: () => onRaitingTap?.call((i + 1).toDouble()),
            child: chooseStar(i),
          ),
        ]
      ],
    );
  }
}
