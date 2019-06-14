import 'package:flutter_web/material.dart';
import 'movie.dart';
import 'list_item_movie.dart';
import 'package:http/http.dart' as http;

class Home extends StatefulWidget {
  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Movies"),
        centerTitle: true,
      ),
      body: Container(
        padding: EdgeInsets.all(10),
        child: FutureBuilder<List<Movie>>(
          future: fetchMovies(),
          builder: (context, snapshot){
            if (snapshot.hasData) {
                return displayMovies(snapshot.data);
              } else if (snapshot.hasError) {
                return Text("${snapshot.error}");
              }

              // By default, show a loading spinner.
              return CircularProgressIndicator();
          },
        ),
      ),
    );
  }

  // display the movie list
  Widget displayMovies(movies){
    return ListView.builder(
      padding: EdgeInsets.all(20),
      itemCount: movies.length,
      itemBuilder: (context, i){
        return MovieItem(movies[i]);
      },
    );
  
  }

  // fecth the movies list
  Future<List<Movie>> fetchMovies() async{
    var response = await http.get("https://api.androidhive.info/json/movies.json");
    if (response.statusCode == 200) {
      return movieFromJson(response.body);
    } else {
      print("Request failed with status: ${response.statusCode}.");
      return null;
    }
  }
}