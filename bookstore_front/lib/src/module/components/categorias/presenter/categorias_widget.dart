import 'package:bookstore_front/src/module/components/categorias/presenter/categoria_unit.dart';
import 'package:bookstore_front/src/utils/img_utils.dart';
import 'package:bookstore_front/src/utils/text_utils.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class CategoriasWidget extends StatelessWidget {
  const CategoriasWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 50.0, vertical: 50),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
            padding: const EdgeInsets.symmetric(vertical: 25.0),
            child: Text(
              "Categorias",
              style: GoogleFonts.playfairDisplay(
                color: const Color(0xffE67E22),
                fontWeight: FontWeight.w400,
                fontSize: 46,
              ),
            ),
          ),
          categoriaList(ImageUtils.CATEGORIAS_IMGS, TextUtils.CATEGORIAS_TEXT),
        ],
      ),
    );
  }

  Widget categoriaList(List<String> imgs, List<String> texts) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        for (int i = 0; i < imgs.length; i++)
          CategoriaUnit(img: imgs[i], text: texts[i]),
      ],
    );
  }
}
