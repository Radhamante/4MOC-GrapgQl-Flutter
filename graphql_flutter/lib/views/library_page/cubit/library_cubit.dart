import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';
import 'package:graphql_flutter_5_moc/models/library.dart';
import 'package:graphql_flutter_5_moc/repositories/data_repository.dart';
import 'package:graphql_flutter_5_moc/views/search_page/cubit/search_cubit.dart';
import 'package:meta/meta.dart';

part 'library_state.dart';

class LibraryCubit extends Cubit<LibraryState> {
  LibraryCubit(this.dataRepository) : super(LibraryInitial()) {
    setFirstDataList();
  }
  final TextEditingController libraryController = TextEditingController();
  final DataRepository dataRepository;

  Future<void> setFirstDataList() async {
    emit(LibraryInitial());
    List<dynamic> data = await dataRepository.fetchAllLibrary();
    print(data);
    emit(LibraryLoadedState(data));
  }

  Widget generateLibraryTile(int indexItem) {
    Library library = state.data[indexItem];
    List<Widget> infoItem = [];
    Widget imageItem = const SizedBox();
    infoItem = [
      Text("Nom: ${library.name}"),
      Text("Adress: ${library.address.name}")
    ];
    imageItem = const Icon(
      Icons.museum,
      size: 100,
    );
    return Row(
      children: [
        SizedBox(
          width: 100,
          height: 100,
          child: imageItem,
        ),
        const SizedBox(
          width: 50,
        ),
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: infoItem,
        )
      ],
    );
  }
}
