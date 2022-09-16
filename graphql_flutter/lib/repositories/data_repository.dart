import 'dart:convert';

import 'package:graphql_flutter_5_moc/enums/book_genre.dart';
import 'package:graphql_flutter_5_moc/enums/movie_genre.dart';
import 'package:graphql_flutter_5_moc/graphql/queries/search.dart';
import 'package:graphql_flutter_5_moc/main.dart';
import 'package:graphql_flutter_5_moc/models/address.dart';
import 'package:graphql_flutter_5_moc/models/book.dart';
import 'package:graphql_flutter_5_moc/models/history.dart';
import 'package:graphql_flutter_5_moc/models/library.dart';
import 'package:graphql_flutter_5_moc/models/movie.dart';
import 'package:graphql_flutter_5_moc/models/user.dart';
import 'package:http/http.dart' as http;

class DataRepository {
  Future<List<Library>> fetchAllLibrary() async {
    Address address = Address(20, 20, "st Antoine");
    Library library1 = Library("1", "titi", address, null);
    Library library2 = Library("2", "toto", address, null);
    Library library3 = Library("3", "tata", address, null);
    Library library4 = Library("4", "tete", address, null);
    Library library5 = Library("5", "tyty", address, null);
    return [library1, library2, library3, library4, library5];
  }

  Future<List<dynamic>> fetchEntities(String searchQuery) async {
    // await Future.delayed(const Duration(milliseconds: 1000));
    User user = User("99", "user", "user@mail.fr", true);
    User user2 = User("95", "user2", "user2@mail.fr", false);
    Address address = Address(20, 20, "st Antoine");
    Library library = Library("1", "titi", address, null);

    var res = await http.post(Uri.parse("http://localhost:4000/graphql"),
        body: {"query": querySearch(searchQuery)},
        headers: {"authorization": token});
    var dataRes = jsonDecode(res.body)["data"]["search"];
    var arrayRes = [];
    for (var data in dataRes) {
      switch (data["__typename"]) {
        case "Book":
          arrayRes.add(Book.fromJson(data));
          break;
      }
      //   case "Movie":
      //     arrayRes.add(Book.fromJson(data));
      //     break;
      //   case "User":
      //     arrayRes.add(Book.fromJson(data));
      //     break;
      //   case "Library":
      //     arrayRes.add(Book.fromJson(data));
      //     break;
      // }
    }

    return arrayRes;
  }

  /// Possible type return:
  /// User, Library, Book, Movie
  Future<List<dynamic>> fetchEntitiesBy(String keyWord) async {
    String keyWordLoweredCase = keyWord.toLowerCase();
    List<dynamic> entities = await fetchEntities(keyWord);
    return entities;
    // return entities.where((e) {
    //   if (e is Movie || e is Book) {
    //     return e.title.toLowerCase().contains(keyWordLoweredCase) ||
    //         e.author.toLowerCase().contains(keyWordLoweredCase);
    //   } else if (e is User) {
    //     return e.name.toLowerCase().contains(keyWordLoweredCase);
    //   } else if (e is Library) {
    //     return e.name.toLowerCase().contains(keyWordLoweredCase) ||
    //         e.address.name.toLowerCase().contains(keyWordLoweredCase);
    //   }
    //   return false;
    // }).toList();
  }

  Future<List<dynamic>> fetchBorrowablesBy(String id) async {
    await Future.delayed(const Duration(milliseconds: 1000));
    User user = User("1", "toto", "toto@toto.fr", true);
    Address address = Address(20, 20, "st Antoine");
    Library library = Library("1", "titi", address, null);
    // Book book1 = Book(
    //   "1",
    //   "abc",
    //   "les blagues de toto",
    //   "toto",
    //   DateTime.now(),
    //   library,
    //   // user,
    //   "https://www.bdfugue.com/media/catalog/product/cache/1/image/400x/17f82f742ffe127f42dca9de82fb58b1/9/7/9782413024798_1_75.jpg",
    //   // [BookGenre.KIDS],
    // );
    Movie movie = Movie(
      "2",
      "les misérables",
      "Victor Hugo",
      DateTime.now(),
      library,
      user,
      "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcRCySWWQjSo-klJpCY9-ty8KVPfJ3lA5GxYcA&usqp=CAU",
      [MovieGenre.ADVENTURE],
    );
    // Book book2 = Book(
    //   "3",
    //   "abcde",
    //   "Dragon ball Z",
    //   "Victor Hugo",
    //   DateTime.now(),
    //   library,
    //   // null,
    //   "https://images-na.ssl-images-amazon.com/images/I/71BaBz2cBLL.jpg",
    //   [BookGenre.MANGA],
    // );

    return [movie];
  }
}
