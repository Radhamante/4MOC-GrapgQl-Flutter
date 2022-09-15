import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';

part 'borrowable_history_state.dart';

class BorrowableHistoryCubit extends Cubit<BorrowableHistoryState> {
  BorrowableHistoryCubit() : super(BorrowableHistoryInitial());
}
