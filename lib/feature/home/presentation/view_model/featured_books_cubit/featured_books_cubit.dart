import 'package:bloc/bloc.dart';
import 'package:bookly/feature/home/data/repos/home_repo.dart';
import 'package:bookly/feature/home/data/repos/home_repo_impl.dart';
import 'package:equatable/equatable.dart';
import 'package:meta/meta.dart';

import '../../../data/models/book_model/book_model.dart';

part 'featured_books_state.dart';

class FeaturedBooksCubit extends Cubit<FeaturedBooksState> {
  FeaturedBooksCubit(this.homeRepoImpl) : super(FeaturedBooksInitial());
  final HomeRepoImpl homeRepoImpl;

  Future<void> fetchFeaturedBooks() async {
    emit(FeaturedBooksLoading());
    var data = await homeRepoImpl.fetchFeaturedBooks();
    data.fold((failure) {
      emit(FeaturedBooksFailure(failure.errMessage));
    }, (books) {
      emit(FeaturedBooksSuccess(books.cast<BookModel>()));
    });
  }
}
