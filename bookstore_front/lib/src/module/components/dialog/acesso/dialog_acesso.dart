import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class DialogAcessoScreen extends StatelessWidget {
  const DialogAcessoScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final Size tamanhoTela = MediaQuery.of(context).size;
    final double largura = tamanhoTela.width; // Largura da tela
    final double altura = tamanhoTela.height; // Altura da tela
    return Scaffold(
      backgroundColor: Colors.black.withOpacity(0.5),
      body: Center(
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
                    child: _buildAcesso(context),
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
                    child: _buildCriarConta(context),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

Widget _buildAcesso(context) {
  return Column(
    crossAxisAlignment: CrossAxisAlignment.start,
    mainAxisSize: MainAxisSize.min,
    children: [
      _tittle('Já sou cliente'),
      textFild("E-mail"),
      textFild("Senha", isSenha: true),
      _buttonMenu(context, "Acessar Conta"),
    ],
  );
}

Widget _buildCriarConta(context) {
  return Column(
    crossAxisAlignment: CrossAxisAlignment.start,
    mainAxisSize: MainAxisSize.min,
    children: [
      _tittle('Criar Conta'),
      textFild("Nome Completo"),
      textFild("E-mail"),
      textFild("Senha", isSenha: true),
      textFild("Confirmação de Senha", isSenha: true),
      _buttonMenu(context, "Confirmar"),
    ],
  );
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
  // TextEditingController controller,//TODO: preencher as lógicas
  String text, {
  FocusNode? focusNode,
  bool isSenha = false,
}) {
  return Padding(
    padding: const EdgeInsets.all(12.0),
    child: TextFormField(
      focusNode: focusNode,
      obscureText: isSenha,
      // controller: controller,
      onFieldSubmitted: (value) {
        // Lógica para quando o usuário submeter o campo
        print('Buscando livro: $value');
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
    child: TextButton(
      child: Text(
        text,
        style: GoogleFonts.playfairDisplay(
          color: const Color(0xffFFC300),
          fontWeight: FontWeight.w700,
          fontSize: 20,
        ),
      ),
      onPressed: () {
        // ignore: avoid_dynamic_calls
        //selectOption(text, highScreen);
      },
    ),
  );
}

Widget _buttonMenu(context, String text) {
  return Center(
    child: Padding(
      padding: const EdgeInsets.all(15.0),
      child: OutlinedButton(
        onPressed: () {
          // openAcess(context, acesso);
        },
        style: OutlinedButton.styleFrom(
          side: const BorderSide(color: Color(0xffFFC300), width: 2),
          overlayColor: const Color(0xffFFC300),
          shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8)),
        ),
        child: _buttonText(text),
      ),
    ),
  );
}
