import 'package:flutter/material.dart';
import 'package:star_rating/star_rating.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: MyHomePage(title: 'Flutter Demo Home Page'),
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
    });
  }

  void _decrementHalfStar() {
    setState(() {
      _rating -= 0.5;
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
              'Rating: $_rating',
              style: Theme.of(context).textTheme.display1,
            ),
            Center(
              child: StarRating(
                length: starLength,
                rating: _rating,
                between: 5.0,
                starSize: 30.0,
                onRaitingTap: (rating) {
                  print('Clicked rating: $rating');
                  setState(() {
                    _rating = rating;
                  });
                },
              ),
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
