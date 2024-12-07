// ignore: depend_on_referenced_packages
import 'package:bookstore_front/src/module/bookstore/presenter/bookstore_bloc.dart';
import 'package:bookstore_front/src/module/bookstore/presenter/bookstore_screen.dart';
import 'package:bookstore_front/src/module/components/dialog/acesso/presenter/dialog_acesso_bloc.dart';
import 'package:dio/dio.dart';
import 'package:flutter_modular/flutter_modular.dart';

class AppModule extends Module {
  @override
  List<Bind> get binds => [
        Bind<Dio>((i) => Dio()),
        Bind<BookstoreBloc>((i) => BookstoreBloc()),
        Bind<DialogAcessoBloc>((i) => DialogAcessoBloc()),
      ];

  @override
  List<ModularRoute> get routes => [
        ChildRoute('/', child: (context, args) => const BookstoreScreen()),
      ];
}
