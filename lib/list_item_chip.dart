import 'package:flutter_web/material.dart';

class Genre extends StatelessWidget {
  final String genre;

  Genre(this.genre);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.all(5),
      padding: EdgeInsets.all(5),
      decoration: BoxDecoration(
          color: Colors.white,
            borderRadius: BorderRadius.circular(5),
        ),
        child: Text(
          genre,
          style: TextStyle(
            fontSize: 16,
          ),
        ),
    );
  }
}