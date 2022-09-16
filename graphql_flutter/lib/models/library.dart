import 'package:graphql_flutter_5_moc/models/address.dart';
import 'package:graphql_flutter_5_moc/models/book.dart';

class Library {
  String id;
  String name;
  Address address;
  List<Book>? books;
  Library(this.id, this.name, this.address, this.books);
}
