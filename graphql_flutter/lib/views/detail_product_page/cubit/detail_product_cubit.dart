import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';

part 'detail_product_state.dart';

class DetailProductCubit extends Cubit<DetailProductState> {
  DetailProductCubit() : super(DetailProductInitial());
}
