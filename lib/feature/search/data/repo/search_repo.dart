import 'package:bookly/core/errors/failures.dart';

import 'package:dartz/dartz.dart';

import '../../../home/data/models/book_model/book_model.dart';

abstract class SearchRepo {
  Future<Either<Failure, List<BookModel>>> searchBooks(
      {required String bookName});
}
