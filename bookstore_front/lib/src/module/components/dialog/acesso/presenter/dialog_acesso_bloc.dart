import 'package:bookstore_front/src/module/components/dialog/acesso/domain/cliente.dart';
import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';

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
  final Client clientModular = Modular.get<Client>();

  final _dio = Dio();
  final _header = {'Content-Type': 'application/json'};
  final String _urlBase =
      "https://web1bookstore-2341d7ab5f45.herokuapp.com/api/";

  Future<void> postClient(
      String nome, String email, String senha, context) async {
    try {
      _dio.post(
        _urlBase + "clientes/",
        data: {'nome': nome, 'email': email, 'senha': senha},
        options: Options(
          headers: _header,
        ),
      );

      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text('Cadastro realizado com sucesso!')),
      );
      clearAll();
    } catch (error) {
      debugPrint(error.toString());

      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(
            content: Text('Erro no cadastro'), backgroundColor: Colors.red),
      );
      clearAll();
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

  Future<void> submitFormCadastro(context) async {
    if (formKeyCadastro.currentState!.validate()) {
      final nome = nomeController.text;
      final email = emailController.text;
      final senha = senhaController.text;
      await postClient(nome, email, senha, context);
    }
  }

  void submitFormLogin(context, Function logado) {
    if (formKeyLogin.currentState!.validate()) {
      final email = nomeLoginController.text;
      verificarLogin(email, context, logado);
    }
  }

// Função para verificar login
  Future<bool> verificarLogin(String email, context, Function logado) async {
    try {
      final List<Client> clientes = await getCliente();
      // Verifica se existe algum cliente com o nome e senha fornecidos
      for (Client cliente in clientes) {
        if (cliente.email == email) {
          clientModular.email = cliente.email;
          clientModular.nome = cliente.nome;
          //clearAll();
          logado();
          ScaffoldMessenger.of(context).showSnackBar(
            const SnackBar(content: Text('Login realizado com sucesso!')),
          );
          Navigator.of(context).pop();

          return true;
        }
      }
      clearAll();
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(
            content: Text('Erro ao realizar o login'),
            backgroundColor: Colors.red),
      );
      return false;
    } catch (e) {
      debugPrint(e.toString());
      clearAll();
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(
            content: Text('Erro ao realizar o login'),
            backgroundColor: Colors.red),
      );
      return false;
    }
  }

  void clearAll() {
    nomeController.clear();
    emailController.clear();
    senhaController.clear();
    confirmarSenhaController.clear();
    nomeLoginController.clear();
    senhaLoginController.clear();
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
