import 'package:flutter/material.dart';
import 'package:star_rating/star_rating.dart';

void main() => runApp(const StarRatingDemo());

class StarRatingDemo extends StatelessWidget {
  const StarRatingDemo({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Star Rating Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: const MyHomePage(title: 'Star Rating Demo Home Page'),
      debugShowCheckedModeBanner: false,
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({required this.title, super.key});

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  final int starLength = 7;
  double _rating = 0;

  void _incrementHalfStar() {
    setState(() {
      _rating += 0.5;
      if (_rating > starLength) {
        _rating = starLength.toDouble();
      }
    });
  }

  void _decrementHalfStar() {
    setState(() {
      _rating -= 0.5;
      if (_rating < 0.0) {
        _rating = 0.0;
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Star Rating Example'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Text(
              'Rating: $_rating / ${starLength.toDouble()}',
              style: Theme.of(context).textTheme.headlineMedium,
            ),
            StarRating(
              mainAxisAlignment: MainAxisAlignment.center,
              length: starLength,
              rating: _rating,
              between: 5,
              starSize: 30,
              onRaitingTap: (rating) {
                print('Clicked rating: $rating / $starLength');
                setState(() {
                  _rating = rating;
                });
              },
            ),
          ],
        ),
      ),
      floatingActionButton: Column(
        crossAxisAlignment: CrossAxisAlignment.end,
        mainAxisAlignment: MainAxisAlignment.end,
        children: <Widget>[
          FloatingActionButton(
            onPressed: _incrementHalfStar,
            tooltip: 'Increment',
            child: const Icon(Icons.arrow_drop_up),
          ),
          FloatingActionButton(
            onPressed: _decrementHalfStar,
            tooltip: 'Decrement',
            child: const Icon(Icons.arrow_drop_down),
          ),
        ],
      ),
    );
  }
}
