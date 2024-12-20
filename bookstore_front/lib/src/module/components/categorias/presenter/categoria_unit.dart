// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';

class CategoriaUnit extends StatelessWidget {
  final String img;
  final String text;
  const CategoriaUnit({Key? key, required this.img, required this.text})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(children: [Image.asset(img, fit: BoxFit.cover), Text(text)]);
  }
}
