// ignore_for_file: constant_identifier_names

part of 'home_cubit.dart';

enum IndexBottomNavigation {
  BORROWED(0),
  SEARCH(1),
  HISTORY(2),
  LIBRARY(3);

  const IndexBottomNavigation(this.value);
  final int value;
}

@immutable
abstract class HomeState {
  HomeState(this.selectedIndex);
  int selectedIndex;
}

class HomeBorrowedSelectedState extends HomeState {
  HomeBorrowedSelectedState() : super(IndexBottomNavigation.BORROWED.value);
}

class HomeSearchSelectedState extends HomeState {
  HomeSearchSelectedState() : super(IndexBottomNavigation.SEARCH.value);
}

class HomeHistorySelectedState extends HomeState {
  HomeHistorySelectedState() : super(IndexBottomNavigation.HISTORY.value);
}

class HomeLibrarySelectedState extends HomeState {
  HomeLibrarySelectedState() : super(IndexBottomNavigation.LIBRARY.value);
}
