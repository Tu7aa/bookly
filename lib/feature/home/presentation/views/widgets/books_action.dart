import 'package:bookly/feature/home/data/models/book_model/book_model.dart';
import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';

import '../../../../../core/functions/launch_url.dart';
import '../../../../../core/utils/widgets/custom_button.dart';

class BooksAction extends StatelessWidget {
  const BooksAction({Key? key, required this.bookModel}) : super(key: key);
  final BookModel bookModel;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 38),
      child: Row(
        children:  [
          const Expanded(
            child: CustomButton(
              backgroundColor: Colors.white,
              textColor: Colors.black,
              borderRadius: BorderRadius.only(
                topLeft: Radius.circular(16),
                bottomLeft: Radius.circular(16),
              ),
              text: 'Free',
            ),
          ),
          Expanded(
              child: CustomButton(
            onPressed: () async{
              launchCustomUr(context, 'bookModel.volumeInfo.previewLink');
            },
            backgroundColor: const Color(0xffEF8262),
            textColor: Colors.white,
            borderRadius: const BorderRadius.only(
              topRight: Radius.circular(12),
              bottomRight: Radius.circular(12),
            ),
            text: getText(bookModel),
            fontSize: 16,
          ))
        ],
      ),
    );
  }

  String getText(BookModel bookModel) {
    if(bookModel.volumeInfo.previewLink == null){
      return'Not Available' ;
    }else{
      return'Preview';
    }
  }
}
