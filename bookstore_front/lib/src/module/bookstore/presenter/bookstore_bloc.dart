import 'package:flutter/material.dart';

class BookstoreBloc {
  final TextEditingController controllerText = TextEditingController();
  final FocusNode focusNode = FocusNode();
  final ScrollController scrollController = ScrollController();

  void scrollToIndex(String optionSelected, double highScreen) {
    double position = 0;
    if (optionSelected == "Categorias") {
      position = 0.5 * highScreen;
    } else if (optionSelected == "Sobre Nós") {
      position = 1.4 * highScreen;
    }
    scrollController.animateTo(
      position,
      duration: const Duration(milliseconds: 500),
      curve: Curves.easeInOut,
    );
  }

  void openAcess(BuildContext context, Widget widget) {
    Navigator.of(context).push(
      PageRouteBuilder(
        opaque: false,
        pageBuilder: (BuildContext context, _, __) {
          return widget;
        },
      ),
    );
  }

  void dispose() {
    controllerText.dispose();
    focusNode.dispose();
    scrollController.dispose();
  }
}
