import 'package:bookly/core/errors/failures.dart';
import 'package:bookly/feature/home/data/models/book_model/book_model.dart';
import 'package:bookly/feature/home/data/repos/home_repo.dart';
import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';

class HomeRepoImpl implements HomeRepo {
  @override
  Future<Either<Failure, List<BookModel>>> fetchFeaturedBooks() async {
    try {
      var response = await Dio().get(
          'https://www.googleapis.com/books/v1/volumes?Filtering=free-ebooks&q=subject: zombies');
      List<BookModel> books = [];
      for (var item in response.data['items']) {
        books.add(BookModel.fromJson(item));
      }
      return right(books);
    } catch (e) {
      if (e is DioError) {
        return left(ServerFailure.fromDioError(e));
      }
      return left(ServerFailure(e.toString()));
    }
  }

  @override
  Future<Either<Failure, List<BookModel>>> fetchNewsetBooks() async {
    try {
      var response = await Dio().get(
          'https://www.googleapis.com/books/v1/volumes?Filtering=free-ebooks&Sorting=newest &q=subject:fiction');
      List<BookModel> books = [];
      for (var item in response.data['items']) {
        books.add(BookModel.fromJson(item));
      }
      return right(books);
    } catch (e) {
      if (e is DioError) {
        return left(ServerFailure.fromDioError(e));
      }
      return left(ServerFailure(e.toString()));
    }
  }

  @override
  Future<Either<Failure, List<BookModel>>> fetchSimilerBooks(
      {required String category}) async {
    try {
      var response = await Dio().get(
          'https://www.googleapis.com/books/v1/volumes?Filtering=free-ebooks&Sorting=relevance&q=subject: drama');
      List<BookModel> books = [];
      for (var item in response.data['items']) {
        books.add(BookModel.fromJson(item));
      }
      return right(books);
    } catch (e) {
      if (e is DioError) {
        return left(ServerFailure.fromDioError(e));
      }
      return left(ServerFailure(e.toString()));
    }
  }
}
