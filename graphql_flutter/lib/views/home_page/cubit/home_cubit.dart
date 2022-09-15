import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';
import 'package:graphql_flutter/models/user.dart';
import 'package:graphql_flutter/views/borrowed_page/borrowed_page.dart';
import 'package:graphql_flutter/views/history_page/borrowable_history_page.dart';
import 'package:graphql_flutter/views/library_page/library_page.dart';
import 'package:graphql_flutter/views/search_page/search_page.dart';
import 'package:graphql_flutter/views/userHistory_page/user_history_page.dart';
import 'package:meta/meta.dart';

part 'home_state.dart';

class HomeCubit extends Cubit<HomeState> {
  HomeCubit(this.userData) : super(HomeSearchSelectedState());
  final User userData;

  void setHomePage(int currentIndex) {
    if (currentIndex == IndexBottomNavigation.BORROWED.value) {
      emit(HomeBorrowedSelectedState());
    } else if (currentIndex == IndexBottomNavigation.SEARCH.value) {
      emit(HomeSearchSelectedState());
    } else if (currentIndex == IndexBottomNavigation.HISTORY.value) {
      emit(HomeHistorySelectedState());
    } else if (currentIndex == IndexBottomNavigation.LIBRARY.value) {
      emit(HomeLibrarySelectedState());
    }
  }

  Widget generateHomeContentByState() {
    if (state is HomeBorrowedSelectedState) {
      return BorrowedPage(
        userData: userData,
      );
    } else if (state is HomeSearchSelectedState) {
      return const SearchPage();
    } else if (state is HomeHistorySelectedState) {
      return UserHistoryPage();
    } else if (state is HomeLibrarySelectedState) {
      return LibraryPage();
    }
    return const SizedBox();
  }
}
