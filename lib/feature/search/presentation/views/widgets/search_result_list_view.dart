  import 'package:bookly/core/utils/shimmer/cutom_loading_search.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';

import '../../../../../core/utils/app_router.dart';
import '../../../../../core/utils/widgets/custom_error.dart';
import '../../../../home/presentation/views/widgets/best_saller_list_view_item.dart';
import '../../view_model/cubits/search_cubit.dart';


class SearchResultListView extends StatelessWidget {
  const SearchResultListView({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<SearchCubit, SearchState>(builder: (context, state) {
      if (state is SearchSuccess) {
        return ListView.separated(
          padding:const EdgeInsets.symmetric(vertical: 10.0),
          itemCount: state.books.length,
          physics: const BouncingScrollPhysics(),
          itemBuilder: (context, index) => InkWell(
            onTap: () {
              GoRouter.of(context).push(
                AppRouter.kBookDetailsView,
                extra: state.books[index],
              );
            },
            child: NewsetBooksListViewItem(bookModel: state.books[index]),
          ),
          separatorBuilder: (context, index) => const SizedBox(height: 15.0),
        );
      }
      if (state is SearchFailure) {
        return CustomError(errMessage: state.errMessage);
      } else {
        return const SizedBox();
      }
    });
  }
}
