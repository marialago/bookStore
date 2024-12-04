// ignore: depend_on_referenced_packages
import 'package:bookstore_front/src/main/presenter/bookstore_screen.dart';
import 'package:bookstore_front/src/components/buscar_livro/presenter/buscar_bloc.dart';
import 'package:dio/dio.dart';
import 'package:flutter_modular/flutter_modular.dart';

class AppModule extends Module {
  @override
  void binds(Injector i) {
    final dio = Dio();
    i.add<Dio>(() => dio);
    i.add<Buscarbloc>(Buscarbloc.new);
  }

  @override
  void routes(RouteManager r) {
    r.child('/', child: (_) => const BookstoreScreen());
  }
}
