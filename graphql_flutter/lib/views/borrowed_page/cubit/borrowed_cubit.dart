import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';

part 'borrowed_state.dart';

class BorrowedCubit extends Cubit<BorrowedState> {
  BorrowedCubit() : super(BorrowedInitial());
}
