class Livro {
  final String? titulo;
  final String? descricao;
  final String? imagem;
  final String? autor;
  final double? preco;
  final String? categoria;

  Livro({
    this.titulo,
    this.descricao,
    this.imagem,
    this.autor,
    this.preco,
    this.categoria,
  });

  Map<String, dynamic> toMap() {
    return {
      "titulo": titulo,
      "descricao": descricao,
      "imagem": imagem,
      "autor": autor,
      "preco": preco,
      "categoria": categoria,
    };
  }

  factory Livro.fromMap(Map<String, dynamic> map) {
    return Livro(
      titulo: map["titulo"] as String?,
      descricao: map["descricao"] as String?,
      imagem: map["imagem"] as String?,
      autor: map["autor"] as String?,
      preco: map["preco"] as double?,
      categoria: map["categoria"] as String?,
    );
  }

  static List<Livro> listFromJson(List<dynamic> json) {
    return json.map((e) => Livro.fromMap(e as Map<String, dynamic>)).toList();
  }
}
