import 'package:flutter/material.dart';
import 'package:segunda_prova/Bd/model.dart';

class TelaDetalhes extends StatelessWidget {
  final Membro membro;

  TelaDetalhes({required this.membro});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Detalhes do Membro"),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            _buildText("ID: ${membro.id}"),
            _buildText("Nome: ${membro.nome}"),
            _buildText("Função: ${membro.funcao}"),
            _buildText("Caminho da Imagem: ${membro.imagePath}"),
          ],
        ),
      ),
    );
  }

  Widget _buildText(String text) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 8),
      child: Text(
        text,
        style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
      ),
    );
  }
}
