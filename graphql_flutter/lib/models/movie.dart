import 'package:graphql_flutter/enums/book_genre.dart';
import 'package:graphql_flutter/enums/movie_genre.dart';
import 'package:graphql_flutter/models/history.dart';
import 'package:graphql_flutter/models/library.dart';
import 'package:graphql_flutter/models/user.dart';

class Movie {
  String id;
  String title;
  String author;
  DateTime date;
  Library library;
  User? borrower;
  String imageUrl;
  List<MovieGenre> genre;
  // List<History> historys;

  Movie(
    this.id,
    this.title,
    this.author,
    this.date,
    this.library,
    this.borrower,
    this.imageUrl,
    this.genre,
    // this.historys,
  );
}
