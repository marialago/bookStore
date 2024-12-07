import 'package:bookstore_front/src/module/components/buscar_livro/domain/livro.dart';
import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:rxdart/rxdart.dart';

class BuscaBloc {
  final TextEditingController textController = TextEditingController();
  BehaviorSubject<List<Livro>>? livroStrem =
      BehaviorSubject<List<Livro>>.seeded([]);
  Stream<List<Livro>>? get livroOutput => livroStrem?.stream;
  BehaviorSubject<bool> loading = BehaviorSubject<bool>.seeded(false);
  Stream<bool>? get loadingOut => loading.stream;
  final _dio = Dio();
  final _header = {'Content-Type': 'application/json'};
  final String _urlBase =
      "https://web1bookstore-2341d7ab5f45.herokuapp.com/api/";

  Future<List<Livro>> getLivros() async {
    final String endpoint;
    final auxLivro;
    final response;
    try {
      loading.sink.add(true);

      if (int.tryParse(textController.text) == null &&
          textController.text.isNotEmpty) {
        endpoint =
            '${_urlBase}livros/buscar_por_categoria/${textController.text}';
        response = await _dio.get(endpoint, options: Options(headers: _header));
        auxLivro = Livro.listFromJson(response.data);
      } else {
        endpoint = '${_urlBase}livros/${textController.text}';
        response = await _dio.get(endpoint, options: Options(headers: _header));
        auxLivro = int.tryParse(textController.text) != null
            ? Livro.fromMap(response.data)
            : Livro.listFromJson(response.data);
      }

      livroStrem?.sink.add(auxLivro is List<Livro> ? auxLivro : [auxLivro]);
      loading.sink.add(false);
      return auxLivro is List<Livro> ? auxLivro : [auxLivro];
    } on DioException catch (e) {
      livroStrem?.sink.addError(e);
      loading.sink.add(false);
      if (e.response != null) {
        throw Exception('Erro ${e.response?.statusCode}: ${e.response?.data}');
      } else {
        throw Exception('Erro ao se conectar ao servidor: ${e.message}');
      }
    }
  }
}
