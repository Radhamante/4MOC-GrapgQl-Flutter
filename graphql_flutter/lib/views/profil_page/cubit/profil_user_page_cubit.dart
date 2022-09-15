import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';

part 'profil_user_page_state.dart';

class ProfilUserPageCubit extends Cubit<ProfilUserPageState> {
  ProfilUserPageCubit() : super(ProfilUserPageInitial());
}
