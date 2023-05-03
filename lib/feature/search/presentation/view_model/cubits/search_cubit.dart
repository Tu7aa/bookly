import 'package:bloc/bloc.dart';
import 'package:bookly/feature/search/data/repo/search_repo.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:meta/meta.dart';

import '../../../../home/data/models/book_model/book_model.dart';

part 'search_state.dart';

class SearchCubit extends Cubit<SearchState> {
  SearchCubit(this.homeRepo) : super(SearchInitial());
  final SearchRepo homeRepo;

  static SearchCubit get(BuildContext context) => BlocProvider.of(context);

  Future<void> fetchSearchedBooks({required String bookName}) async {
    emit(SearchLoading());
    var data = await homeRepo.searchBooks(bookName: bookName);
    data.fold((failure) {
      emit(SearchFailure(failure.errMessage));
    }, (books) {
      emit(SearchSuccess(books));
    });
  }

  TextEditingController controller = TextEditingController();
}
