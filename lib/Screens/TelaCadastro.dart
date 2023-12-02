import 'package:flutter/material.dart';
import 'package:segunda_prova/domain/membro.dart';
import 'package:segunda_prova/Screens/main.dart';

class TelaCadastro extends StatelessWidget {
  final TextEditingController _nomeController = TextEditingController();
  final TextEditingController _funcaoController = TextEditingController();
  final TextEditingController _imagePathController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Cadastro de Membro"),
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
            const SizedBox(height: 16),
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
                // Lógica de salvar o membro no banco de dados
                _salvarMembro(context);
              },
              child: Text("Cadastrar Membro"),
            ),
          ],
        ),
      ),
    );
  }

  void _salvarMembro(BuildContext context) {
    // Substitua essa lógica pela implementação real de salvamento no banco de dados
    Membro novoMembro = Membro(
      nome: _nomeController.text,
      funcao: _funcaoController.text,
     // imagePath: _imagePathController.text,
    );

    // Aqui você deve implementar a lógica para salvar o membro no banco de dados

    // Exibindo SnackBar
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: Text('Membro cadastrado com sucesso!'),
      ),
    );

    // Navegando para a TelaHome após o cadastro
    Navigator.pushReplacement(
      context,
      MaterialPageRoute(builder: (context) => TelaHome()),
    );
  }
}
