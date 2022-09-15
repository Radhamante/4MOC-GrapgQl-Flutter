part of 'borrowed_cubit.dart';

@immutable
abstract class BorrowedState {
  BorrowedState(this.data);
  List<dynamic> data;
}

class BorrowedLoadingState extends BorrowedState {
  BorrowedLoadingState() : super([]);
}

class BorrowedLoadedState extends BorrowedState {
  BorrowedLoadedState(super.data);
}
