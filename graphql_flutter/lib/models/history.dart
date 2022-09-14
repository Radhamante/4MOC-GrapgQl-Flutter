import 'package:graphql_flutter/models/book.dart';
import 'package:graphql_flutter/models/user.dart';

class History {
  String id;
  Book book;
  User borrower;
  String startDate;
  String? endDate;
  History(this.id, this.book, this.borrower, this.startDate, this.endDate);
}
