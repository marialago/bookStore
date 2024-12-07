import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class DialogAcessoScreen extends StatelessWidget {
  final GlobalKey<FormState> formKeyCadastro;
  final GlobalKey<FormState> formKeyLogin;
  final Function submit;
  final Function login;
  final TextEditingController nomeController;
  final TextEditingController emailController;
  final TextEditingController senhaController;
  final TextEditingController confirmarSenhaController;
  final TextEditingController nomeAcessoController;
  final TextEditingController senhaAcessoController;
  final bool carregando;
  final Function logado;
  const DialogAcessoScreen(
      {Key? key,
      required this.formKeyCadastro,
      required this.formKeyLogin,
      required this.submit,
      required this.login,
      required this.nomeController,
      required this.emailController,
      required this.senhaController,
      required this.confirmarSenhaController,
      required this.nomeAcessoController,
      required this.senhaAcessoController,
      required this.logado,
      this.carregando = false})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    final Size tamanhoTela = MediaQuery.of(context).size;
    final double largura = tamanhoTela.width;
    final double altura = tamanhoTela.height;
    return GestureDetector(
      onTap: () {
        logado();
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
                        child: _buildAcesso(
                            context,
                            formKeyLogin,
                            nomeAcessoController,
                            senhaAcessoController,
                            login,
                            logado),
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
                        child: _buildCriarConta(
                            context,
                            submit,
                            formKeyCadastro,
                            nomeController,
                            emailController,
                            senhaController,
                            confirmarSenhaController,
                            carregando),
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

Widget _buildAcesso(
    context,
    formKeyLogin,
    TextEditingController nomeAcessoController,
    TextEditingController senhaAcessoController,
    Function login,
    Function logado) {
  return Column(
    crossAxisAlignment: CrossAxisAlignment.start,
    mainAxisSize: MainAxisSize.min,
    children: [
      _tittle('Já sou cliente'),
      Form(
        key: formKeyLogin,
        child: Column(
          children: [
            textFild(nomeAcessoController, "E-mail"),
          ],
        ),
      ),
      textFild(senhaAcessoController, "Senha", isSenha: true),
      _buttonMenu(context, "Acessar Conta", login, logado: logado),
    ],
  );
}

Widget _buildCriarConta(
    context,
    Function submit,
    formKeyCadastro,
    TextEditingController nomeController,
    TextEditingController emailController,
    TextEditingController senhaController,
    TextEditingController confirmarSenhaController,
    bool carregando) {
  return Column(
    crossAxisAlignment: CrossAxisAlignment.start,
    mainAxisSize: MainAxisSize.min,
    children: [
      _tittle('Criar Conta'),
      Form(
        key: formKeyCadastro,
        child: Column(
          children: [
            textFild(nomeController, "Nome Completo"),
            textFild(emailController, "E-mail"),
            textFild(senhaController, "Senha", isSenha: true),
            textFild(confirmarSenhaController, "Confirmação de Senha",
                isSenha: true),
          ],
        ),
      ),
      _buttonMenu(context, "Confirmar", submit),
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

Widget _buttonMenu(context, String text, Function action, {Function? logado}) {
  return Center(
    child: Padding(
        padding: const EdgeInsets.all(15.0),
        child: OutlinedButton(
          onPressed: () async {
            logado == null
                ? await action(context)
                : await action(context, logado);
          },
          style: OutlinedButton.styleFrom(
            side: const BorderSide(color: Color(0xffFFC300), width: 2),
            //overlayColor: const Color(0xffFFC300),
            shape:
                RoundedRectangleBorder(borderRadius: BorderRadius.circular(8)),
          ),
          child: _buttonText(text),
        )),
  );
}
