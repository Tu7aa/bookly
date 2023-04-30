import 'package:bookly/core/utils/styles.dart';
import 'package:bookly/feature/home/data/models/book_model/book_model.dart';
import 'package:flutter/material.dart';

import 'best_saller_list_view.dart';
import 'custom_app_bar.dart';
import 'featured_list_view.dart';

class ViewHomeBody extends StatelessWidget {
  const ViewHomeBody({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return CustomScrollView(
      physics: const BouncingScrollPhysics(),
      slivers: [
        SliverToBoxAdapter(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: const [
              Padding(
                padding: EdgeInsets.symmetric(horizontal: 30),
                child: CustomAppBar(),
              ),
              FeaturedBooksListView(),
              SizedBox(
                height: 45,
              ),
              Padding(
                padding: EdgeInsets.symmetric(horizontal: 30),
                child: Text(
                  "Newset Books",
                  style: Styles.textStyle18,
                ),
              ),
              SizedBox(height: 20),
            ],
          ),
        ),
        const SliverFillRemaining(
            child: Padding(
          padding: EdgeInsets.symmetric(horizontal: 30),
          child: NewsetBooksListView(),
        ))
      ],
    );
  }
}
