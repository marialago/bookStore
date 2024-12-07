// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:bookstore_front/src/module/components/buscar_livro/domain/livro.dart';
import 'package:flutter/material.dart';

class LivroUnit extends StatelessWidget {
  final Livro livro;
  final Function adicionar;
  const LivroUnit({Key? key, required this.livro, required this.adicionar})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        adicionar(livro, context);
      },
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(children: [
          livro.imagem != null && livro.imagem!.isNotEmpty
              ? Image.network(
                  livro.imagem ?? '',
                  fit: BoxFit.cover,
                  errorBuilder: (context, error, stackTrace) {
                    return const Icon(Icons.menu_book_rounded, size: 50);
                  },
                )
              : const Icon(Icons.menu_book_rounded, size: 50),
          Text(
            livro.titulo ?? '',
            style: const TextStyle(
              color: Color(0xff34495E),
              fontWeight: FontWeight.w700,
              fontSize: 14,
            ),
          ),
          Text(
            livro.autor ?? '',
            style: const TextStyle(
              color: Color(0xff34495E),
              fontWeight: FontWeight.w400,
              fontSize: 13,
            ),
          ),
          Text(
            livro.preco != null ? 'R\$' + livro.preco.toString() : '',
            style: const TextStyle(
              color: Color(0xff34495E),
              fontWeight: FontWeight.w700,
              fontSize: 14,
            ),
          ),
          Text(
            livro.categoria != null ? 'Categoria: ' + livro.categoria! : '',
            style: const TextStyle(
              color: Color(0xff34495E),
              fontWeight: FontWeight.w400,
              fontSize: 13,
            ),
          )
        ]),
      ),
    );
  }
}
