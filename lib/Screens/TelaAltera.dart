import 'package:flutter/material.dart';
import 'package:segunda_prova/domain/membro.dart';
import 'package:segunda_prova/helpers/membro_helper.dart';


class TelaAltera extends StatefulWidget {
  final Membro membro;

  TelaAltera({required this.membro});

  @override
  _TelaAlteraState createState() => _TelaAlteraState();
}

class _TelaAlteraState extends State<TelaAltera> {
  late TextEditingController _nomeController;
  late TextEditingController _emailController;
  late TextEditingController _funcaoController;
  late TextEditingController _imagePathController;

  final _membroHelper = MembroHelper();

  @override
  void initState() {
    super.initState();

    // Inicialize os controladores com os valores do membro
    _nomeController = TextEditingController(text: widget.membro.nome);
    _funcaoController = TextEditingController(text: widget.membro.funcao);
    //_imagePathController = TextEditingController(text: widget.membro.imagePath);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("EDITAR DADOS DO MEMBRO"),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Text("Nome do Membro"),
            TextFormField(
              controller: _nomeController,
              decoration: InputDecoration(
                hintText: "Digite o nome",
              ),
            ),
            SizedBox(height: 16),
            Text("Função do Membro"),
            TextFormField(
              controller: _funcaoController,
              decoration: InputDecoration(
                hintText: "Digite a função",
              ),
            ),
            SizedBox(height: 16),
            Text("Caminho da Imagem"),
            TextFormField(
              controller: _imagePathController,
              decoration: InputDecoration(
                hintText: "Digite o caminho da imagem",
              ),
            ),
            SizedBox(height: 32),
            ElevatedButton(
              onPressed: () {
                // Lógica para salvar as alterações no membro
                _alterarMembro(context);
              },
              child: Text("Salvar Alterações"),
            ),
          ],
        ),
      ),
    );
  }

  void _alterarMembro(BuildContext context) {
    // Substitua essa lógica pela implementação real de alteração no banco de dados
    Membro membroAlterado = Membro(
      id: widget.membro.id,
      nome: _nomeController.text,
      idade: 0,
      email: _emailController.text,
      estadoCivil: widget.membro.estadoCivil,
      funcao: widget.membro.funcao,
    );

    _membroHelper.updateMembro(membroAlterado);

    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: Text('Membro alterado com sucesso!'),
      ),
    );

    Navigator.pop(context);
  }
}