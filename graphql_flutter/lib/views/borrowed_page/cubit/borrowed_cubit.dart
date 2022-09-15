import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';
import 'package:graphql_flutter/models/book.dart';
import 'package:graphql_flutter/models/movie.dart';
import 'package:graphql_flutter/repositories/data_repository.dart';
import 'package:intl/intl.dart';
import 'package:meta/meta.dart';

part 'borrowed_state.dart';

class BorrowedCubit extends Cubit<BorrowedState> {
  BorrowedCubit(this.dataRepository, this.idUser)
      : super(BorrowedLoadingState()) {
    fetchBorrowables();
  }
  final String idUser;
  final DataRepository dataRepository;

  Future<void> fetchBorrowables() async {
    emit(BorrowedLoadingState());
    List<dynamic> data = await dataRepository.fetchBorrowablesBy(idUser);
    emit(BorrowedLoadedState(data));
  }

  Widget generateBorrowedItemTile(int index) {
    final data = state.data[index];
    if (!(data is Movie) && !(data is Book)) {
      return const SizedBox();
    }
    List<Widget> infoItem = [];
    String formattedDate = DateFormat('dd/MM/yyyy').format(data.date);
    if (data is Book) {
      infoItem = [
        const Text("Type: Book"),
        Text("Title: ${data.title}"),
        Text("Author: ${data.author}"),
        Text("Date: $formattedDate"),
      ];
    } else if (data is Movie) {
      infoItem = [
        const Text("Type: Movie"),
        Text("Title: ${data.title}"),
        Text("Date: $formattedDate"),
      ];
    }
    return InkWell(
      splashColor: Colors.lightBlue,
      onTap: () async {},
      child: Row(
        children: [
          SizedBox(
            width: 100,
            height: 100,
            child: Image.network(data.imageUrl.toString()),
          ),
          const SizedBox(
            width: 50,
          ),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: infoItem,
          )
        ],
      ),
    );
  }
}
