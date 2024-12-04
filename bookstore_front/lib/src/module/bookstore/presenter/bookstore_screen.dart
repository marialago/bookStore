import 'package:bookstore_front/src/module/bookstore/presenter/bookstore_bloc.dart';
import 'package:bookstore_front/src/module/components/appbar/presenter/appbar_core.dart';
import 'package:bookstore_front/src/module/components/buscar_livro/presenter/buscar_widget.dart';
import 'package:bookstore_front/src/module/components/categorias/presenter/categorias_widget.dart';
import 'package:bookstore_front/src/module/components/sobre/presenter/sobre_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';

class BookstoreScreen extends StatefulWidget {
  const BookstoreScreen({super.key});

  @override
  State<BookstoreScreen> createState() => _BookstoreScreenState();
}

class _BookstoreScreenState extends State<BookstoreScreen> {
  final controller = Modular.get<BookstoreBloc>();

  @override
  void dispose() {
    controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xffECF0F1),
      body: ListView(
        children: [
          const AppbarWidget(),
          BuscarLivroWidget(
            controller: controller.controllerText,
            focusNode: controller.focusNode,
          ),
          const CategoriasWidget(),
          const SobreWidget(),
        ],
      ),
    );
  }
}
