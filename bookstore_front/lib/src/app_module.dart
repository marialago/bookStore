// ignore: depend_on_referenced_packages
import 'package:bookstore_front/src/module/bookstore/presenter/bookstore_bloc.dart';
import 'package:bookstore_front/src/module/bookstore/presenter/bookstore_screen.dart';
import 'package:bookstore_front/src/module/components/buscar_livro/presenter/buscar_bloc.dart';
import 'package:bookstore_front/src/module/components/dialog/acesso/domain/cliente.dart';
import 'package:bookstore_front/src/module/components/dialog/acesso/presenter/dialog_acesso_bloc.dart';
import 'package:dio/dio.dart';
import 'package:flutter_modular/flutter_modular.dart';

class AppModule extends Module {
  @override
  List<Bind> get binds => [
        Bind<Dio>((i) => Dio()),
        Bind<BookstoreBloc>((i) => BookstoreBloc()),
        Bind<DialogAcessoBloc>((i) => DialogAcessoBloc()),
        Bind<BuscaBloc>((i) => BuscaBloc()),
        Bind<Client>((i) => Client())
      ];

  @override
  List<ModularRoute> get routes => [
        ChildRoute('/', child: (context, args) => const BookstoreScreen()),
      ];
}
