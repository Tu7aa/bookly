import 'package:bookly/core/utils/styles.dart';
import 'package:flutter/material.dart';

class CustomError extends StatelessWidget {
  const CustomError({Key? key, required this.errMessage}) : super(key: key);
  final String errMessage;

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Text(errMessage, style: Styles.textStyle18),
    );
  }
}
