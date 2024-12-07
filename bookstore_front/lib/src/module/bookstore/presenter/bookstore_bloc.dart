import 'package:bookstore_front/src/module/components/buscar_livro/domain/livro.dart';
import 'package:bookstore_front/src/module/components/dialog/acesso/domain/cliente.dart';
import 'package:bookstore_front/src/module/components/dialog/acesso/presenter/dialog_acesso_bloc.dart';
import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:rxdart/rxdart.dart';

class BookstoreBloc {
  final DialogAcessoBloc acessoBloc = Modular.get<DialogAcessoBloc>();
  final TextEditingController controllerText = TextEditingController();
  final FocusNode focusNode = FocusNode();
  final ScrollController scrollController = ScrollController();
  Client clientModular = Modular.get<Client>();
  List<Livro> carrinho = Modular.get<List<Livro>>();

  BehaviorSubject<bool> logado = BehaviorSubject<bool>.seeded(false);
  Stream<bool>? get logadoOut => logado.stream;

  final _dio = Dio();
  final _header = {'Content-Type': 'application/json'};
  final String _urlBase =
      "https://web1bookstore-2341d7ab5f45.herokuapp.com/api/";
  void scrollToIndex(String optionSelected, double highScreen) {
    double position = 0;
    if (optionSelected == "Categorias") {
      position = 0.5 * highScreen;
    } else if (optionSelected == "Sobre Nós") {
      position = 1.4 * highScreen;
    }
    scrollController.animateTo(
      position,
      duration: const Duration(milliseconds: 500),
      curve: Curves.easeInOut,
    );
  }

  String valorTotalCompra() {
    double conta = 0;
    for (Livro _livro in carrinho) {
      conta = conta + (_livro.preco ?? 0.0);
    }
    print('conta: $conta');
    return conta.toString();
  }

  void adicionarCarrinho(Livro livro, context) async {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: const Text("Item Adicionado ao Carrinho"),
          content:
              const Text("O item foi adicionado com sucesso ao seu carrinho."),
          actions: <Widget>[
            TextButton(
              onPressed: () {
                Navigator.of(context).pop(); // Fecha o AlertDialog
              },
              child: const Text("OK"),
            ),
          ],
        );
      },
    );
    carrinho.add(livro);
  }

  void logadoCheck() async {
    if (clientModular.email != null) logado.sink.add(true);
  }

  void openOption(BuildContext context, Widget widget) async {
    Navigator.of(context).push(
      PageRouteBuilder(
        opaque: false,
        pageBuilder: (BuildContext context, _, __) {
          return widget;
        },
      ),
    );
  }

  Future<bool> postClient(String nome, String email, String senha) async {
    try {
      _dio.post(
        _urlBase + "clientes/",
        data: {'nome': nome, 'email': email, 'senha': senha},
        options: Options(
          headers: _header,
        ),
      );
      return true;
    } catch (error) {
      debugPrint(error.toString());
      return false;
    }
  }

  Future<List<Client>> getCliente(int id) async {
    try {
      final response = await _dio.get(
        _urlBase + 'clientes/',
        options: Options(
          headers: _header,
        ),
      );
      return Client.listFromJson(response.data);
    } on DioException catch (e) {
      if (e.response != null) {
        throw Exception('Erro ${e.response?.statusCode}: ${e.response?.data}');
      } else {
        throw Exception('Erro ao se conectar ao servidor: ${e.message}');
      }
    }
  }

  void dispose() {
    controllerText.dispose();
    focusNode.dispose();
    scrollController.dispose();
  }
}
