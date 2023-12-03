import 'package:flutter/material.dart';
import 'package:segunda_prova/domain/membro.dart';
import 'package:segunda_prova/Screens/main.dart';
import 'package:segunda_prova/helpers/membro_helper.dart';


class TelaCadastro extends StatelessWidget {
  final TextEditingController _nomeController = TextEditingController();
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _estadoCivilController = TextEditingController();
  final TextEditingController _funcaoController = TextEditingController();
  final TextEditingController _imagePathController = TextEditingController();
  final _membroHelper = MembroHelper();

  TelaCadastro({super.key});


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Cadastro de Membro"),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            const Text("Nome do Membro"),
            TextFormField(
              controller: _nomeController,
              decoration: const InputDecoration(
                hintText: "Digite o nome",
              ),
            ),
            SizedBox(height: 16),
            Text("Função do Membro"),
            TextFormField(
              controller: _funcaoController,
              decoration: const InputDecoration(
                hintText: "Digite a função",
              ),
            ),
            const SizedBox(height: 16),
            Text("Caminho da Imagem"),
            TextFormField(
              controller: _imagePathController,
              decoration: const InputDecoration(
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
    Membro novoMembro = Membro(
    nome: _nomeController.text,
    idade: 0,
    email: _emailController.text,
    estadoCivil: _estadoCivilController.text,
    funcao: _funcaoController.text, 
    id: 0,
  );

    _membroHelper.saveMembro(novoMembro);

    ScaffoldMessenger.of(context).showSnackBar(
      const SnackBar(
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