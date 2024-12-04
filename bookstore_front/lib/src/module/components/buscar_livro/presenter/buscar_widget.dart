// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import 'package:bookstore_front/src/utils/text_utils.dart';

class BuscarLivroWidget extends StatelessWidget {
  final FocusNode focusNode;
  final TextEditingController controller;
  const BuscarLivroWidget({
    super.key,
    required this.focusNode,
    required this.controller,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.fromLTRB(180.0, 80, 180, 0),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(
            TextUtils.MAIN_TEXT,
            textAlign: TextAlign.center,
            style: GoogleFonts.playfairDisplay(
              color: const Color(0xff2C3E50),
              fontWeight: FontWeight.w500,
              fontSize: 43,
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(top: 80.0),
            child: TextFormField(
              focusNode: focusNode,
              controller: controller,
              onFieldSubmitted: (value) {
                // Lógica para quando o usuário submeter o campo
                print('Buscando livro: $value');
              },
              decoration: InputDecoration(
                prefixIcon: const Icon(Icons.search, color: Colors.white),
                filled: true,
                fillColor: const Color(0xffE67E22),
                hintText: 'Buscar Livros',
                hintStyle: const TextStyle(fontSize: 16, color: Colors.white),
                contentPadding: const EdgeInsets.symmetric(vertical: 16.0),
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(10.0),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
