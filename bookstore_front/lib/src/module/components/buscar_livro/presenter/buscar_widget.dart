// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:bookstore_front/src/module/components/buscar_livro/domain/livro.dart';
import 'package:bookstore_front/src/module/components/buscar_livro/presenter/livro_unit.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import 'package:bookstore_front/src/utils/text_utils.dart';

class BuscarLivroWidget extends StatelessWidget {
  final TextEditingController controller;
  final Function getLivro;
  final List<Livro>? livros;
  const BuscarLivroWidget({
    Key? key,
    required this.controller,
    required this.getLivro,
    this.livros,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Padding(
          padding: const EdgeInsets.fromLTRB(180.0, 80, 180, 0),
          child: Column(
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
                padding: const EdgeInsets.only(top: 80.0, bottom: 20),
                child: TextFormField(
                  controller: controller,
                  onFieldSubmitted: (value) {
                    getLivro();
                  },
                  style: const TextStyle(
                    color: Colors.white, // Define a cor do texto como branco
                    fontSize: 16, // Define o tamanho do texto, opcional
                  ),
                  decoration: InputDecoration(
                    prefixIcon: const Icon(Icons.search, color: Colors.white),
                    filled: true,
                    fillColor: const Color(0xffE67E22),
                    hintText: 'Buscar Livros',
                    hintStyle:
                        const TextStyle(fontSize: 16, color: Colors.white),
                    contentPadding: const EdgeInsets.symmetric(vertical: 16.0),
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(10.0),
                      borderSide: const BorderSide(
                        color: Color(0xff34495E),
                      ),
                    ),
                    enabledBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(10.0),
                      borderSide: const BorderSide(
                          color: Color(0xff34495E),
                          width: 2.0), // Borda habilitada
                    ),
                    focusedBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(10.0),
                      borderSide: const BorderSide(
                          color: Color(0xff34495E), width: 2.0), // Borda focada
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
        livroList(livros ?? []),
      ],
    );
  }

  Widget livroList(List<Livro> livros) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Wrap(
        spacing: 8.0,
        runSpacing: 8.0,
        children: livros.map((livro) => LivroUnit(livro: livro)).toList(),
      ),
    );
  }
}
