// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:bookstore_front/src/module/components/buscar_livro/domain/livro.dart';
import 'package:flutter/material.dart';

class LivroCard extends StatelessWidget {
  final Livro livro;
  const LivroCard({
    Key? key,
    required this.livro,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Card(
      color: const Color(0xff34495E),
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(12),
      ),
      elevation: 4, // Sombra do Card
      child: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            _textWidget(livro.titulo ?? ''),
            _textWidget(livro.autor ?? ''),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                _textWidget(livro.categoria ?? ''),
                _textWidget(
                  livro.preco == null ? '' : "R\$" + livro.preco.toString(),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }

  Widget _textWidget(String text) {
    return Text(
      text,
      style: const TextStyle(fontSize: 18, color: Colors.white),
    );
  }
}
