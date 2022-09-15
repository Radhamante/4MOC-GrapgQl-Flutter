part of 'library_cubit.dart';

@immutable
abstract class LibraryState {
  LibraryState(this.data);
  List<dynamic> data;
  String keyWordSearch = "";
}

class LibraryInitial extends LibraryState {
  LibraryInitial() : super([]);
}



// part of 'search_cubit.dart';

// @immutable
// abstract class SearchState {
//   SearchState(this.data);
//   List<dynamic> data;
//   String keyWordSearch = "";
// }

// class SearchLoadingState extends SearchState {
//   SearchLoadingState() : super([]);
// }

class LibraryLoadedState extends LibraryState {
  LibraryLoadedState(super.data) {
  }
}
