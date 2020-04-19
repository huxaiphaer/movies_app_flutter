import 'package:flutter/material.dart';
import 'package:movies_app_flutter_app/src/ui/movie_list.dart';

void main() => runApp(App());

class App extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: Scaffold(
        body: MovieList(),
      ),
    );
  }
}

