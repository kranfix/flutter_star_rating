import 'package:flutter/material.dart';
import 'package:star_rating/star_rating.dart';

void main() => runApp(StarRatingDemo());

class StarRatingDemo extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Star Rating Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: MyHomePage(title: 'Star Rating Demo Home Page'),
      debugShowCheckedModeBanner: false,
    );
  }
}

class MyHomePage extends StatefulWidget {
  MyHomePage({Key key, this.title}) : super(key: key);

  final String title;

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  final int starLength = 7;
  double _rating = 0.0;

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
        title: Text('Star Rating Example'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Text(
              'Rating: $_rating / ${starLength.toDouble()}',
              style: Theme.of(context).textTheme.display1,
            ),
            StarRating(
              mainAxisAlignment: MainAxisAlignment.center,
              length: starLength,
              rating: _rating,
              between: 5.0,
              starSize: 30.0,
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
            child: Icon(Icons.arrow_drop_up),
          ),
          FloatingActionButton(
            onPressed: _decrementHalfStar,
            tooltip: 'Decrement',
            child: Icon(Icons.arrow_drop_down),
          ),
        ],
      ),
    );
  }
}
