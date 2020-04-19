import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:movies_app_flutter_app/src/blocs/movies_bloc.dart';
import 'package:movies_app_flutter_app/src/models/item_model.dart';

class MovieList extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    bloc.fetchAllMovies();
    return Scaffold(
      appBar: AppBar(
        title: Text('Popular Movies'),
      ),
      body: StreamBuilder(
        stream: bloc.allMovies,
        builder: (context, AsyncSnapshot<ItemModel> snapshot) {
          if (snapshot.hasData) {
            return buildList(snapshot);
          } else if (snapshot.hasError) {
            return Text(snapshot.error.toString());
          }
          return Center(child: CircularProgressIndicator());
        },
      ),
    );
  }

  Widget buildList(AsyncSnapshot<ItemModel> snapshot) {
    return GridView.builder(
        itemCount: snapshot.data.results.length,
        gridDelegate:
            new SliverGridDelegateWithFixedCrossAxisCount(crossAxisCount: 3),
        itemBuilder: (BuildContext context, int position) {
          return Image.network(
            'https://image.tmdb.org/t/p/w185${snapshot.data.results[position].poster_path}',
            fit: BoxFit.cover,
          );
        });
  }
}
