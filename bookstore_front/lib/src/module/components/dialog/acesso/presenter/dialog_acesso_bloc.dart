import 'package:bookstore_front/src/module/components/dialog/acesso/domain/cliente.dart';
import 'package:dio/dio.dart';
import 'package:flutter/material.dart';

class DialogAcessoBloc {
  final GlobalKey<FormState> formKeyCadastro = GlobalKey<FormState>();
  final GlobalKey<FormState> formKeyLogin = GlobalKey<FormState>();
  final TextEditingController nomeController = TextEditingController();
  final TextEditingController emailController = TextEditingController();
  final TextEditingController senhaController = TextEditingController();
  final TextEditingController confirmarSenhaController =
      TextEditingController();
  final TextEditingController nomeLoginController = TextEditingController();
  final TextEditingController senhaLoginController = TextEditingController();

  final _dio = Dio();
  final _header = {'Content-Type': 'application/json'};
  final String _urlBase =
      "https://web1bookstore-2341d7ab5f45.herokuapp.com/api/";

  Future<void> postClient(String nome, String email, String senha) async {
    try {
      print('entor3 ');
      _dio.post(
        _urlBase + "clientes/",
        data: {'nome': nome, 'email': email, 'senha': senha},
        options: Options(
          headers: _header,
        ),
      );

      const AlertDialog(title: Text("cadastro realizado"));
    } catch (error) {
      print('error aqui! : $error');
      debugPrint(error.toString());
      const AlertDialog(title: const Text("Erro no cadastro"));
    }
  }

  Future<List<Client>> getCliente() async {
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

  Future<void> submitFormCadastro() async {
    if (formKeyCadastro.currentState!.validate()) {
      final nome = nomeController.text;
      final email = emailController.text;
      final senha = senhaController.text;
      await postClient(nome, email, senha);
    }
  }

  void submitFormLogin() {
    if (formKeyLogin.currentState!.validate()) {
      final nome = nomeLoginController.text;
      //final senha = senhaLoginController.text;
      verificarLogin(nome);
    }
  }

// Função para verificar login
  Future<bool> verificarLogin(String email) async {
    try {
      final List<Client> clientes = await getCliente();
      // Verifica se existe algum cliente com o nome e senha fornecidos
      for (Client cliente in clientes) {
        if (cliente.email == email) {
          return true;
        }
      }
      return false;
    } catch (e) {
      debugPrint(e.toString());
      return false;
    }
  }

  void dispose() {
    nomeController.dispose();
    emailController.dispose();
    senhaController.dispose();
    confirmarSenhaController.dispose();
    nomeLoginController.dispose();
    senhaLoginController.dispose();
  }
}
