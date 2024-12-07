class Client {
  final int id;
  final String nome;
  final String email;

  Client({
    required this.id,
    required this.nome,
    required this.email,
  });

  Map<String, dynamic> toMap() {
    return {
      "id": id,
      "nome": nome,
      "email": email,
    };
  }

  factory Client.fromMap(Map<String, dynamic> map) {
    return Client(
      id: map["id"] as int,
      nome: map["nome"] as String,
      email: map["email"] as String,
    );
  }

  static List<Client> listFromJson(List<dynamic> json) {
    return json.map((e) => Client.fromMap(e as Map<String, dynamic>)).toList();
  }
}
