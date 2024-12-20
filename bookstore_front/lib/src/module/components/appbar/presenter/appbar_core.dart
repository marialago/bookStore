// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:bookstore_front/src/module/components/dialog/acesso/domain/cliente.dart';
import 'package:bookstore_front/src/utils/img_utils.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class AppbarWidget extends StatelessWidget {
  final void Function(String, double) selectOption;
  final double highScreen;
  final void Function(BuildContext, Widget) openOption;
  final Widget acesso;
  final Client client;
  final Widget compra;

  const AppbarWidget({
    Key? key,
    required this.selectOption,
    required this.highScreen,
    required this.openOption,
    required this.acesso,
    required this.client,
    required this.compra,
  }) : super(key: key);

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
              appbarMenuText('Categorias'),
              appbarMenuText('Sobre Nós'),
            ],
          ),
          Row(
            children: [
              client.nome == null
                  ? appbarMenuItens(context, text: "entrar")
                  : Text(
                      client.nome!,
                      style: const TextStyle(
                          color: Color(0xffF1C40F),
                          fontWeight: FontWeight.w600,
                          fontSize: 18),
                    ),
              appbarMenuItens(context),
            ],
          ),
        ],
      ),
    );
  }

  Widget appbarMenuText(String text) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 15.0),
      child: GestureDetector(
        child: Text(
          text,
          style: GoogleFonts.playfairDisplay(
              color: const Color(0xffF1C40F),
              fontWeight: FontWeight.w600,
              fontSize: 18),
        ),
        onTap: () {
          selectOption(text, highScreen);
        },
      ),
    );
  }

  Widget appbarMenuItens(context, {String? text}) {
    return Padding(
      padding: const EdgeInsets.all(15.0),
      child: OutlinedButton(
        onPressed: () async {
          if (text != null) {
            openOption(context, acesso);
          } else {
            openOption(context, compra);
          }
        },
        style: OutlinedButton.styleFrom(
          side: const BorderSide(color: Color(0xffFFC300), width: 2),
          shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8)),
        ),
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: text != null
              ? appbarMenuText(text)
              : const Icon(
                  Icons.shopping_cart_outlined,
                  color: Color(0xffFFC300),
                ),
        ),
      ),
    );
  }
}
