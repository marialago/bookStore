import 'package:bookstore_front/src/utils/img_utils.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class AppbarWidget extends StatelessWidget {
  const AppbarWidget({super.key});

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
          Row(children: [appbarMenuItens(text: "entrar"), appbarMenuItens()]),
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
      onPressed: () {},
    );
  }

  Widget appbarMenuItens({String? text}) {
    return Padding(
      padding: const EdgeInsets.all(15.0),
      child: OutlinedButton(
        onPressed: () {},
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
