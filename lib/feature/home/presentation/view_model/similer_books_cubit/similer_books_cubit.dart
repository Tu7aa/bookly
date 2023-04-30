import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:meta/meta.dart';

import '../../../data/models/book_model/book_model.dart';
import '../../../data/repos/home_repo_impl.dart';

part 'similer_books_state.dart';

class SimilerBooksCubit extends Cubit<SimilerBooksState> {
  SimilerBooksCubit(this.homeRepoImpl) : super(SimilerBooksInitial());

  final HomeRepoImpl homeRepoImpl;

  Future<void> fetchSimilerBooks({required String category}) async {
    emit(SimilerBooksLoading());
    var data = await homeRepoImpl.fetchSimilerBooks(category: category);
    data.fold((failure) {
      emit(SimilerBooksFailure(failure.errMessage));
    }, (books) {
      emit(SimilerBooksSuccess(books));
    });
  }
}
