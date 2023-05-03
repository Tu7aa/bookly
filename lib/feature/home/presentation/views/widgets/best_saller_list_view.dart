import 'package:bookly/core/utils/widgets/custom_error.dart';
import 'package:bookly/core/utils/widgets/custom_loading_indicator.dart';
import 'package:bookly/feature/home/data/models/book_model/book_model.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../../core/utils/shimmer/custom_loading_best_sellEr.dart';
import '../../../../../core/utils/shimmer/custom_loading_container.dart';
import '../../view_model/newest_book_cubit/newset_books_cubit.dart';
import 'best_saller_list_view_item.dart';

class NewsetBooksListView extends StatelessWidget {
  const NewsetBooksListView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<NewsetBooksCubit, NewsetBooksState>(
      builder: (context, state) {
        if (state is NewsetBooksSuccess) {
          return ListView.builder(
              physics: const NeverScrollableScrollPhysics(),
              padding: EdgeInsets.zero,
              itemCount: state.books.length,
              itemBuilder: (context, index) {
                return Padding(
                  padding: const EdgeInsets.symmetric(vertical: 5),
                  child: NewsetBooksListViewItem(
                    bookModel: state.books[index],
                  ),
                );
              });
        } else if (state is NewsetBooksFailure) {
          return CustomError(errMessage: state.errMessage);
        } else {
          return const SizedBox();
        }
      },
    );
  }
}
