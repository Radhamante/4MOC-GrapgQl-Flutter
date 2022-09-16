import 'package:bloc/bloc.dart';
import 'package:graphql_flutter_5_moc/main.dart';
import 'package:graphql_flutter_5_moc/models/book.dart';
import 'package:graphql_flutter_5_moc/repositories/data_repository.dart';
import 'package:meta/meta.dart';

part 'detail_product_state.dart';

class DetailProductCubit extends Cubit<DetailProductState> {
  DetailProductCubit(this.dataRepository, this.book)
      : super(DetailProductInitial());
  final DataRepository dataRepository;
  final Book book;
  Future<void> borrow() async {
    emit(DetailProductBorrowLoadingState());
    var res = await dataRepository.borrow(book.id, user!.id);
    if (res != null) {
      emit(DetailProductBorrowLoadedState());
    }
  }
}
