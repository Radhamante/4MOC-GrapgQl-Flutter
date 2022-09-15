part of 'search_cubit.dart';

@immutable
abstract class SearchState {
  SearchState(this.data);
  List<dynamic> data;
  String keyWordSearch = "";
}

class SearchLoadingState extends SearchState {
  SearchLoadingState() : super([]);
}

class SearchLoadedState extends SearchState {
  SearchLoadedState(super.data, String newKeyWord) {
    keyWordSearch = newKeyWord;
  }
}
