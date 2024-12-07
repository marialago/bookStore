import 'package:bookstore_front/src/module/bookstore/presenter/bookstore_bloc.dart';
import 'package:bookstore_front/src/module/components/appbar/presenter/appbar_core.dart';
import 'package:bookstore_front/src/module/components/buscar_livro/domain/livro.dart';
import 'package:bookstore_front/src/module/components/buscar_livro/presenter/buscar_bloc.dart';
import 'package:bookstore_front/src/module/components/buscar_livro/presenter/buscar_widget.dart';
import 'package:bookstore_front/src/module/components/categorias/presenter/categorias_widget.dart';
import 'package:bookstore_front/src/module/components/dialog/acesso/presenter/dialog_acesso.dart';
import 'package:bookstore_front/src/module/components/dialog/acesso/presenter/dialog_acesso_bloc.dart';
import 'package:bookstore_front/src/module/components/sobre/presenter/sobre_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';

class BookstoreScreen extends StatefulWidget {
  const BookstoreScreen({Key? key}) : super(key: key);

  @override
  State<BookstoreScreen> createState() => _BookstoreScreenState();
}

class _BookstoreScreenState extends State<BookstoreScreen> {
  final controller = Modular.get<BookstoreBloc>();
  final DialogAcessoBloc acessoBloc = Modular.get<DialogAcessoBloc>();
  final BuscaBloc buscaBloc = Modular.get<BuscaBloc>();
  @override
  void dispose() {
    controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final double screenHeight = MediaQuery.of(context).size.height;

    return Scaffold(
      backgroundColor: const Color(0xffECF0F1),
      body: ListView(
        controller: controller.scrollController,
        children: [
          StreamBuilder<bool>(
              stream: controller.logadoOut,
              builder: (context, snapshot) {
                return AppbarWidget(
                  selectOption: controller.scrollToIndex,
                  highScreen: screenHeight,
                  openAcess: controller.openAcess,
                  client: controller.clientModular,
                  acesso: DialogAcessoScreen(
                    logado: controller.logadoCheck,
                    confirmarSenhaController:
                        acessoBloc.confirmarSenhaController,
                    emailController: acessoBloc.emailController,
                    submit: acessoBloc.submitFormCadastro,
                    senhaAcessoController: acessoBloc.senhaLoginController,
                    formKeyCadastro: acessoBloc.formKeyCadastro,
                    login: acessoBloc.submitFormLogin,
                    nomeAcessoController: acessoBloc.nomeLoginController,
                    formKeyLogin: acessoBloc.formKeyLogin,
                    nomeController: acessoBloc.nomeController,
                    senhaController: acessoBloc.senhaController,
                  ),
                );
              }),
          StreamBuilder<bool>(
              stream: buscaBloc.loadingOut,
              builder: (context, snapshotLoading) {
                if (snapshotLoading.data == true) {
                  return const Center(child: CircularProgressIndicator());
                } else {
                  return StreamBuilder<List<Livro>>(
                      stream: buscaBloc.livroOutput,
                      builder: (context, snapshot) {
                        return BuscarLivroWidget(
                          livros: snapshot.data,
                          controller: buscaBloc.textController,
                          getLivro: buscaBloc.getLivros,
                        );
                      });
                }
              }),
          const CategoriasWidget(),
          const SobreWidget(),
        ],
      ),
    );
  }
}
