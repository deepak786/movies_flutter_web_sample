import 'package:flutter_web/material.dart';
import 'movie.dart';
import 'list_item_chip.dart';

class MovieItem extends StatefulWidget {
  final Movie movie;

  MovieItem(this.movie);

  @override
  _MovieItemState createState() => _MovieItemState();
}

class _MovieItemState extends State<MovieItem> {
  @override
  Widget build(BuildContext context) {
    return Card(
      borderOnForeground: true,
      color: Colors.white,
      child: Container(
        padding: EdgeInsets.all(10),
        height: 600,
        decoration: 
         BoxDecoration(
            image: DecorationImage(
              image: NetworkImage(
                widget.movie.image
                
              ),
              fit: BoxFit.cover
            ),
          ),
        child: Align(
          alignment: Alignment.bottomLeft,
          child: Column(
            mainAxisSize: MainAxisSize.min,
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              Container(
                color: Colors.black.withOpacity(0.5),
                padding: EdgeInsets.all(7),
                child: Text(
                  "${widget.movie.title}\n${widget.movie.releaseYear}",
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 25,
                  ),
                ),
              ),
              SizedBox(
                height: 20,
              ),
              Row(
                children: <Widget>[
                  Expanded(
                    flex: 1,
                    child: Wrap(
                      children: widget.movie.genre.map((chip) => Genre(chip)).toList(),
                    ),
                  ),

                  Container(
                    color: Colors.black.withOpacity(0.3),
                    
                    padding: EdgeInsets.all(5),
                    child: Text(
                      widget.movie.rating.toStringAsFixed(1),
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 16,
                      ),
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }

  // get chips
  List<Widget> getChips(List<String> chips){
    List<Widget> list = new List();
    chips.map((chip) => {
      list.add(Genre(chip))
    });
    return list;
  }
}