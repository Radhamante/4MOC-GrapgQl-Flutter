import 'dart:io';

import 'package:graphql_flutter_5_moc/enums/book_genre.dart';
import 'package:graphql_flutter_5_moc/models/history.dart';
import 'package:graphql_flutter_5_moc/models/library.dart';
import 'package:graphql_flutter_5_moc/models/user.dart';

class Book {
  String id;
  String isbn;
  String title;
  String author;
  DateTime date;
  Library? library;
  User? borrower;
  String imageUrl;
  List<BookGenre>? genre;
  // List<History> historys;

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
    // this.historys,
  );

  Book.fromJson(Map<String, dynamic> json)
      : id = json['name'] != null ? json['name'] : "",
        isbn = json['email'] != null ? json['email'] : "",
        title = json['title'] != null ? json['title'] : "",
        author = json['author'] != null ? json['author'] : "",
        date = DateTime.now(),
        library = json['library'] != null ? json['library'] : null,
        borrower = json['borrower'] != null ? json['borrower'] : null,
        imageUrl = json['imageUrl'] != null ? json['imageUrl'] : "",
        genre = [];

  // Map<String, dynamic> toJson() => {
  //       'id': id,
  //       'isbn': isbn,
  //       'title': title,
  //       'author': author,
  //       'date': date,
  //       'library': library,
  //       'borrower': borrower,
  //       'imageUrl': imageUrl,
  //       'genre': genre,
  //     };

}
