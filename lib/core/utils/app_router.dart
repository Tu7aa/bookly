import 'package:bookly/feature/home/data/models/book_model/book_model.dart';
import 'package:bookly/feature/home/presentation/view_model/similer_books_cubit/similer_books_cubit.dart';
import 'package:bookly/feature/search/presentation/views/search_view.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';

import '../../feature/home/data/repos/home_repo_impl.dart';
import '../../feature/home/presentation/views/book_details_view.dart';
import '../../feature/home/presentation/views/home_view.dart';
import '../../feature/splash/presentation/view/splash_view.dart';

abstract class AppRouter {
  static const kHomeView = '/homeView';
  static const kBookDetailsView = '/bookDetailsView';
  static const kSearchView = '/searchView';
  static final router = GoRouter(
    routes: [
      GoRoute(
        path: '/',
        builder: (context, state) => const SplashView(),
      ),
      GoRoute(
        path: kHomeView,
        builder: (context, state) => const HomeView(),
      ),
      GoRoute(
        path: kBookDetailsView,
        builder: (context, state) => BlocProvider(
            create: (context) => SimilerBooksCubit(
                  HomeRepoImpl()..fetchSimilerBooks(category: ''),
                ),
            child:  BookDetailView(
              bookModel: state.extra as BookModel,
            )),
      ),
      GoRoute(
        path: kSearchView,
        builder: (context, state) => const SearchView(),
      ),
    ],
  );
}
