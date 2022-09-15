import 'package:graphql_flutter/enums/book_genre.dart';
import 'package:graphql_flutter/enums/movie_genre.dart';
import 'package:graphql_flutter/models/address.dart';
import 'package:graphql_flutter/models/book.dart';
import 'package:graphql_flutter/models/history.dart';
import 'package:graphql_flutter/models/library.dart';
import 'package:graphql_flutter/models/movie.dart';
import 'package:graphql_flutter/models/user.dart';

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

  Future<List<dynamic>> fetchEntities() async {
    await Future.delayed(const Duration(milliseconds: 1000));
    User user = User("99", "user", "user@mail.fr", true);
    User user2 = User("95", "user2", "user2@mail.fr", false);
    Address address = Address(20, 20, "st Antoine");
    Library library = Library("1", "titi", address, null);
    Movie movie = Movie(
      "1",
      "Kiki la petite sorcière",
      "Hayao Miyazaki",
      DateTime.now(),
      library,
      User("100", "ludo", "ludo@ludo.fr", false),
      "data:image/jpeg;base64,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",
      [MovieGenre.FANTASY],
    );
    //
    Book book1 = Book(
      "1",
      "abc",
      "les blagues de toto",
      "toto",
      DateTime.now(),
      library,
      null,
      "https://www.bdfugue.com/media/catalog/product/cache/1/image/400x/17f82f742ffe127f42dca9de82fb58b1/9/7/9782413024798_1_75.jpg",
      [BookGenre.KIDS],
    );
    Book book2 = Book(
      "2",
      "abcd",
      "les misérables",
      "Victor Hugo",
      DateTime.now(),
      library,
      null,
      "https://images-na.ssl-images-amazon.com/images/I/61qAEbl008L.jpg",
      [BookGenre.ROMAN],
    );
    Book book3 = Book(
      "3",
      "abcde",
      "Dragon ball Z",
      "Victor Hugo",
      DateTime.now(),
      library,
      null,
      "https://images-na.ssl-images-amazon.com/images/I/71BaBz2cBLL.jpg",
      [BookGenre.MANGA],
    );
    library.books = [book1, book2, book3];

    return [movie, book1, book2, book3, library, user, user2];
  }

  /// Possible type return:
  /// User, Library, Book, Movie
  Future<List<dynamic>> fetchEntitiesBy(String keyWord) async {
    String keyWordLoweredCase = keyWord.toLowerCase();
    List<dynamic> entities = await fetchEntities();
    return entities.where((e) {
      if (e is Movie || e is Book) {
        return e.title.toLowerCase().contains(keyWordLoweredCase) ||
            e.author.toLowerCase().contains(keyWordLoweredCase);
      } else if (e is User) {
        return e.name.toLowerCase().contains(keyWordLoweredCase);
      } else if (e is Library) {
        return e.name.toLowerCase().contains(keyWordLoweredCase) ||
            e.address.name.toLowerCase().contains(keyWordLoweredCase);
      }
      return false;
    }).toList();
  }

  Future<List<dynamic>> fetchBorrowablesBy(String id) async {
    await Future.delayed(const Duration(milliseconds: 1000));
    User user = User("1", "toto", "toto@toto.fr", true);
    Address address = Address(20, 20, "st Antoine");
    Library library = Library("1", "titi", address, null);
    Book book1 = Book(
      "1",
      "abc",
      "les blagues de toto",
      "toto",
      DateTime.now(),
      library,
      user,
      "https://www.bdfugue.com/media/catalog/product/cache/1/image/400x/17f82f742ffe127f42dca9de82fb58b1/9/7/9782413024798_1_75.jpg",
      [BookGenre.KIDS],
    );
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
    Book book2 = Book(
      "3",
      "abcde",
      "Dragon ball Z",
      "Victor Hugo",
      DateTime.now(),
      library,
      null,
      "https://images-na.ssl-images-amazon.com/images/I/71BaBz2cBLL.jpg",
      [BookGenre.MANGA],
    );

    return [movie, book1, book2];
  }
}
