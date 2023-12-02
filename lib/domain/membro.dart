class Membro {
  static const String membroTable = "membro_table";
  static const String idColumn = "id";
  static const String nomeColumn = "nome";
  static const String idadeColumn = "idade";
  static const String emailColumn = "email";
  static const String estadoCivilColumn = "estado_civil";
  static const String funcaoColumn = "funcao";
  //static const String imagePathColumn = "imagePath";

  int id = 0;
  String nome = '';
  int idade = 0;
  String email = '';
  String estadoCivil = '';
  String funcao = '';
  //String imagePath;

  Membro({
    required this.id,
    required this.nome,
    required this.idade,
    required this.email,
    required this.estadoCivil,
    required this.funcao,
    //required this.imagePath,
  });

  Membro.fromMap(Map map) {
    id = map[idColumn];
    nome = map[nomeColumn];
    idade = map[idadeColumn];
    email = map[emailColumn];
    estadoCivil = map[estadoCivilColumn];
    funcao = map[funcaoColumn];
    //imagePath = map[imagePathColumn];
  }

  Map<String, dynamic> toMap() {
    return {
      nomeColumn: nome,
      idadeColumn: idade,
      emailColumn: email,
      estadoCivilColumn: estadoCivil,
      funcaoColumn: funcao
    };
  }

  @override
  String toString() {
    return 'Menbro{nome: $nome, idade: $idade, email: $email, estadoCivil: $estadoCivil, funcao: $funcao}';
  }
}
