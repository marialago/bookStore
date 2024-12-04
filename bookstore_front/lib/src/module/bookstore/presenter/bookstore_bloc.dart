import 'package:flutter/material.dart';

class BookstoreBloc {
  final TextEditingController controllerText = TextEditingController();
  final FocusNode focusNode = FocusNode();

  void dispose() {
    controllerText.dispose();
    focusNode.dispose();
  }
}
