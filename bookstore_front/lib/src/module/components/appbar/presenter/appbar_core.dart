// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import 'package:bookstore_front/src/utils/img_utils.dart';

class AppbarWidget extends StatelessWidget {
  final Function selectOption;
  final double highScreen;
  final Function openAcess;
  final Widget acesso;
  // final Widget compra;

  const AppbarWidget({
    super.key,
    required this.selectOption,
    required this.highScreen,
    required this.openAcess,
    required this.acesso,
    //required this.compra,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      color: const Color(0xff34495E),
      height: MediaQuery.of(context).size.height * 0.13,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Row(
            children: [
              Image.asset(ImageUtils.LOGO_BOOKSTORE, fit: BoxFit.cover),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Text(
                  'Páginas Perdidas',
                  style: GoogleFonts.playfairDisplay(
                    color: const Color(0xffF1C40F),
                    fontWeight: FontWeight.w400,
                    fontSize: 46,
                  ),
                ),
              ),
            ],
          ),
          Row(
            children: [
              appbarMenuText('Início'),
              appbarMenuText('Categorias'),
              appbarMenuText('Sobre Nós'),
            ],
          ),
          Row(
            children: [
              appbarMenuItens(context, text: "entrar"),
              appbarMenuItens(context),
            ],
          ),
        ],
      ),
    );
  }

  Widget appbarMenuText(String text) {
    return TextButton(
      child: Text(
        text,
        style: GoogleFonts.playfairDisplay(
          color: const Color(0xffF1C40F),
          fontWeight: FontWeight.w600,
        ),
      ),
      onPressed: () {
        // ignore: avoid_dynamic_calls
        selectOption(text, highScreen);
      },
    );
  }

  Widget appbarMenuItens(context, {String? text}) {
    return Padding(
      padding: const EdgeInsets.all(15.0),
      child: OutlinedButton(
        onPressed: () {
          openAcess(context, acesso);
        },
        style: OutlinedButton.styleFrom(
          side: const BorderSide(color: Color(0xffFFC300), width: 2),
          overlayColor: const Color(0xffFFC300),
          shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8)),
        ),
        child:
            text != null
                ? appbarMenuText(text)
                : const Icon(
                  Icons.shopping_cart_outlined,
                  color: Color(0xffFFC300),
                ),
      ),
    );
  }
}
