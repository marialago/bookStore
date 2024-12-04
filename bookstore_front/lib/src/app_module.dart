// ignore: depend_on_referenced_packages
import 'package:bookstore_front/src/module/bookstore/presenter/bookstore_bloc.dart';
import 'package:bookstore_front/src/module/bookstore/presenter/bookstore_screen.dart';
import 'package:dio/dio.dart';
import 'package:flutter_modular/flutter_modular.dart';

class AppModule extends Module {
  @override
  void binds(Injector i) {
    final dio = Dio();
    i.add<Dio>(() => dio);
    i.add<BookstoreBloc>(BookstoreBloc.new);
  }

  @override
  void routes(RouteManager r) {
    r.child('/', child: (_) => const BookstoreScreen());
  }
}
