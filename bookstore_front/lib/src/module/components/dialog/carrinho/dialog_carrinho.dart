import 'package:bookstore_front/src/module/components/buscar_livro/domain/livro.dart';
import 'package:bookstore_front/src/module/components/buscar_livro/presenter/livro_unit.dart';
import 'package:bookstore_front/src/module/components/dialog/carrinho/livro_card.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class DialogCarrinhoScreen extends StatelessWidget {
  final List<Livro>? livrosCarrinho;
  final Function valorTotal;
  const DialogCarrinhoScreen({
    Key? key,
    this.livrosCarrinho,
    required this.valorTotal,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final Size tamanhoTela = MediaQuery.of(context).size;
    final double largura = tamanhoTela.width;
    final double altura = tamanhoTela.height;
    return GestureDetector(
      onTap: () {
        Navigator.of(context).pop();
      },
      child: Scaffold(
        backgroundColor: Colors.black.withOpacity(0.5),
        body: Center(
          child: GestureDetector(
            onTap: () {},
            child: Container(
              width: largura * 0.8,
              height: altura * 0.8,
              padding: const EdgeInsets.all(20.0),
              color: const Color(0xff2C3E50),
              child: SingleChildScrollView(
                child: Row(
                  children: [
                    Expanded(
                      child: Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 25.0),
                        child: _buildCarrinho(context, livrosCarrinho),
                      ),
                    ),
                    Container(
                      color: const Color(0xffF1C40F),
                      width: 3,
                      height: altura * 0.6,
                    ),
                    Expanded(
                      child: Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 25.0),
                        child: _buildCompra(
                            context, valorTotal(), livrosCarrinho ?? []),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}

Widget _buildCarrinho(context, livrosCarrinho) {
  return Column(
    crossAxisAlignment: CrossAxisAlignment.start,
    mainAxisSize: MainAxisSize.min,
    children: [
      _tittle('Meu Carrinho'),
      Container(
        decoration: BoxDecoration(
          color: Colors.yellow[200], // Cor de fundo do container
          borderRadius:
              BorderRadius.circular(12), // Bordas arredondadas com raio de 12
        ),
        padding: EdgeInsets.all(16), // Espaçamento interno (opcional)
        child: _listLivro(livrosCarrinho ?? []),
      )
    ],
  );
}

Widget _listValor(List<Livro> livros) {
  if (livros.isEmpty) {
    return SizedBox();
  } else {
    return Column(
      mainAxisAlignment: MainAxisAlignment.start,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        textWidget('Subtotal(${livros.length} item(ns))'),
        for (Livro _livro in livros)
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                textWidget(_livro.titulo ?? ""),
                textWidget('R\$ ${_livro.preco}'),
              ],
            ),
          )
      ],
    );
  }
}

Widget _listLivro(List<Livro> livros) {
  if (livros.isEmpty) {
    return Padding(
      padding: const EdgeInsets.all(25.0),
      child: Center(
        child: Column(
          children: [
            const Icon(
              Icons.shopping_cart_outlined,
              color: Color(0xff34495E),
              size: 35,
            ),
            textWidget('Seu carrinho se encontra vazio'),
          ],
        ),
      ),
    );
  } else {
    return Column(
      children: [
        for (Livro _livro in livros)
          LivroCard(
            livro: _livro,
          ),
      ],
    );
  }
}

Widget _buildCompra(context, String valorTotal, List<Livro> livros) {
  return Column(
    crossAxisAlignment: CrossAxisAlignment.start,
    mainAxisSize: MainAxisSize.min,
    children: [
      _tittle('Resumo da Compra'),
      Container(
        decoration: BoxDecoration(
          color: Colors.yellow[200], // Cor de fundo do container
          borderRadius:
              BorderRadius.circular(12), // Bordas arredondadas com raio de 12
        ),
        padding: EdgeInsets.all(16), // Espaçamento interno (opcional)
        child: Column(
          children: [
            _listValor(livros),
            const Divider(
              color: Color(0xffE67E22),
              thickness: 2,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                textWidget("Valor Total"),
                textWidget("R\$ " + valorTotal),
              ],
            ),
            _buttonMenu(context, "Confirmar"),
          ],
        ),
      )
    ],
  );
}

Widget textWidget(String text) {
  return Text(text,
      style: GoogleFonts.playfairDisplay(
        color: const Color(0xff34495E),
        fontWeight: FontWeight.w700,
        fontSize: 20,
      ));
}

Widget _tittle(String text) {
  return Padding(
    padding: const EdgeInsets.all(15.0),
    child: Text(
      text,
      style: GoogleFonts.playfairDisplay(
        color: const Color(0xffF1C40F),
        fontWeight: FontWeight.w400,
        fontSize: 46,
      ),
    ),
  );
}

Widget textFild(
  TextEditingController controller,
  String text, {
  FocusNode? focusNode,
  bool isSenha = false,
}) {
  return Padding(
    padding: const EdgeInsets.all(12.0),
    child: TextFormField(
      obscureText: isSenha,
      controller: controller,
      validator: (value) {
        if (value == null || value.isEmpty) {
          return 'Por favor, insira seu $text.';
        }
        return null;
      },
      decoration: InputDecoration(
        filled: true,
        fillColor: const Color(0xffFFEEA9),
        hintText: text,
        hintStyle: GoogleFonts.playfairDisplay(
          color: const Color(0xff2C3E50),
          fontWeight: FontWeight.w600,
          fontSize: 20,
        ),
        contentPadding: const EdgeInsets.only(left: 30.0),
        enabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(10.0),
          borderSide: const BorderSide(
            color: Color(0xffFFC300),
            width: 3.0,
          ), // Borda amarela
        ),
        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(10.0),
          borderSide: const BorderSide(
            color: Color(0xffFFC300),
            width: 3.0,
          ), // Borda amarela mais grossa
        ),
      ),
    ),
  );
}

Widget _buttonText(String text) {
  return Padding(
    padding: const EdgeInsets.all(8.0),
    child: GestureDetector(
      child: Text(
        text,
        style: GoogleFonts.playfairDisplay(
          color: const Color(0xffFFC300),
          fontWeight: FontWeight.w700,
          fontSize: 20,
        ),
      ),
      onTap: () {
        // ignore: avoid_dynamic_calls
        //selectOption(text, highScreen);
      },
    ),
  );
}

Widget _buttonMenu(context, String text, {Function? action}) {
  return Center(
    child: Padding(
        padding: const EdgeInsets.all(15.0),
        child: OutlinedButton(
          onPressed: () async {
            action == null ? null : await action(context);
          },
          style: OutlinedButton.styleFrom(
            side: const BorderSide(color: Color(0xffFFC300), width: 2),
            backgroundColor: Color(0xff34495E),
            shape:
                RoundedRectangleBorder(borderRadius: BorderRadius.circular(8)),
          ),
          child: _buttonText(text),
        )),
  );
}
