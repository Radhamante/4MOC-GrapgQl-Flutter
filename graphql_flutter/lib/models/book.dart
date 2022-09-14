import 'package:graphql_flutter/enums/genre.dart';
import 'package:graphql_flutter/models/history.dart';
import 'package:graphql_flutter/models/library.dart';
import 'package:graphql_flutter/models/user.dart';

class Book {
  String id;
  String isbn;
  String title;
  String author;
  int date;
  Library library;
  User borrower;
  String imageUrl;
  List<Genre> genre;
  List<History> historys;

  Book(
    this.id,
    this.isbn,
    this.title,
    this.author,
    this.date,
    this.library,
    this.borrower,
    this.imageUrl,
    this.genre,
    this.historys,
  );
}
