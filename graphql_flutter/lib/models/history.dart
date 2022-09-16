import 'package:graphql_flutter_5_moc/models/book.dart';
import 'package:graphql_flutter_5_moc/models/user.dart';

class History {
  String id;
  Book book;
  User borrower;
  String startDate;
  String? endDate;
  History(this.id, this.book, this.borrower, this.startDate, this.endDate);
}
