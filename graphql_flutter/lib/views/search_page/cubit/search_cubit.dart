import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';
import 'package:graphql_flutter_5_moc/models/book.dart';
import 'package:graphql_flutter_5_moc/models/library.dart';
import 'package:graphql_flutter_5_moc/models/movie.dart';
import 'package:graphql_flutter_5_moc/models/user.dart';
import 'package:graphql_flutter_5_moc/repositories/data_repository.dart';
import 'package:intl/intl.dart';
import 'package:meta/meta.dart';

part 'search_state.dart';

const NUMBER_CHARS_TO_SEARCH = 3;

class SearchCubit extends Cubit<SearchState> {
  SearchCubit(this.dataRepository) : super(SearchLoadingState()) {
    setFirstDataList();
  }
  final TextEditingController searchController = TextEditingController();
  final DataRepository dataRepository;

  Future<void> onWriteSearch(String value) async {
    if (value.isEmpty) {
      setFirstDataList();
      return;
    }
    if (value.length < NUMBER_CHARS_TO_SEARCH) {
      return;
    }
    emit(SearchLoadingState());
    // searchController.value = TextEditingValue(
    //   text: value,
    //   selection: TextSelection.fromPosition(
    //     TextPosition(offset: value.length),
    //   ),
    // );
    List<dynamic> data = await dataRepository.fetchEntitiesBy(value);
    emit(SearchLoadedState(data, value));
  }

  Future<void> setFirstDataList() async {
    emit(SearchLoadingState());
    List<dynamic> data = await dataRepository.fetchEntities("");
    print(data);
    emit(SearchLoadedState(data, ""));
  }

  Widget generateProductItemTile(int indexItem) {
    var product = state.data[indexItem];
    String formattedDateYear;
    Widget imageItem = const SizedBox();
    List<Widget> infoItem = [];
    if (product is Movie) {
      formattedDateYear = DateFormat('yyyy').format(product.date);
      infoItem = [
        const Text("Type: Movie"),
        Text("Title: ${product.title}"),
        Text("Author: ${product.author}"),
        Text("Year: $formattedDateYear"),
        Text("Available: ${product.borrower != null ? "no" : "yes"}"),
      ];
      imageItem = Image.network(product.imageUrl.toString());
    } else if (product is Book) {
      formattedDateYear = DateFormat('yyyy').format(product.date);
      infoItem = [
        const Text("Type: Book"),
        Text("Title: ${product.title}"),
        Text("Author: ${product.author}"),
        Text("Year: $formattedDateYear"),
        Text("Available: ${product.borrower != null ? "no" : "yes"}"),
      ];
      imageItem = Image.network(
        product.imageUrl.toString(),
      );
    } else if (product is User) {
      infoItem = [
        const Text("Type: User"),
        Text("Name: ${product.name}"),
        Text("Email: ${product.email}"),
        Text("Year: ${product.isAdmin}"),
        RichText(
          text: TextSpan(
            children: [
              const TextSpan(
                text: "admin: ",
              ),
              WidgetSpan(
                child: product.isAdmin
                    ? const Icon(
                        Icons.check_circle,
                        size: 14,
                        color: Colors.green,
                      )
                    : const Icon(
                        Icons.cancel,
                        size: 14,
                        color: Colors.red,
                      ),
              ),
            ],
          ),
        ),
      ];
      imageItem = const Icon(
        Icons.account_circle,
        size: 100,
      );
    } else if (product is Library) {
      infoItem = [
        const Text("Type: Library"),
        Text("Name: ${product.name}"),
        Text("Address: ${product.address.name}"),
      ];
      imageItem = const Icon(
        Icons.museum,
        size: 100,
      );
    }
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
  // fetchEntities
}
