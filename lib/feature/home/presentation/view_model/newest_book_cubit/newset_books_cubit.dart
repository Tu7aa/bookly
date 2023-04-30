import 'package:bloc/bloc.dart';
import 'package:bookly/feature/home/data/repos/home_repo_impl.dart';
import 'package:equatable/equatable.dart';

import '../../../data/models/book_model/book_model.dart';
import '../../../data/repos/home_repo.dart';

part 'newset_books_state.dart';

class NewsetBooksCubit extends Cubit<NewsetBooksState> {
  NewsetBooksCubit(this.homeRepoImpl) : super(NewsetBooksInitial());

  final HomeRepoImpl homeRepoImpl;

  Future<void> fetchNewsetBooks() async {
    emit(NewsetBooksLoading());
    var data = await homeRepoImpl.fetchNewsetBooks();
    data.fold((failure) {
      emit(NewsetBooksFailure(failure.errMessage));
    }, (books) {
      emit(NewsetBooksSuccess(books));
    });
  }
}
