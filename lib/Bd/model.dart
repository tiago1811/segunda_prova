class Membro {
  int? id;
  String nome;
  String funcao;
  String imagePath;

  // Construtor que requer o ID
  Membro.withID({
    required this.id,
    required this.nome,
    required this.funcao,
    required this.imagePath,
  });

  Membro({
    required this.nome,
    required this.funcao,
    required this.imagePath,
  });
}

