import 'package:bookly/core/errors/failures.dart';
import 'package:bookly/feature/home/data/models/book_model/book_model.dart';
import 'package:bookly/feature/search/data/repo/search_repo.dart';
import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';

class SearchRepoImpl extends SearchRepo {
  @override
  Future<Either<Failure, List<BookModel>>> searchBooks(
      {required String bookName}) async {
    try {
      var response = await Dio().get(
          "https://www.googleapis.com/books/v1/volumes?Filtering=free-ebooks &q=intitle:$bookName");

      List<BookModel> books = [];
      for (var item in response.data["items"]) {
        books.add(BookModel.fromJson(item));
      }

      return Right(books);
    } catch (error) {
      if (error is DioError) {
        return Left(ServerFailure.fromDioError(error));
      } else {
        return Left(ServerFailure(error.toString()));
      }
    }
  }
}
