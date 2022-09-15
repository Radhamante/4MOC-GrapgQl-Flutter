import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';

part 'user_history_page_state.dart';

class UserHistoryPageCubit extends Cubit<UserHistoryPageState> {
  UserHistoryPageCubit() : super(UserHistoryPageInitial());
}
