part of 'detail_product_cubit.dart';

@immutable
abstract class DetailProductState {}

class DetailProductInitial extends DetailProductState {}

class DetailProductLoadingState extends DetailProductState {}

class DetailProductLoadedState extends DetailProductState {}

class DetailProductBorrowLoadingState extends DetailProductState {}

class DetailProductBorrowLoadedState extends DetailProductState {}
