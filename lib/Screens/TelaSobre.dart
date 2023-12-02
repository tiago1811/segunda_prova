import 'package:flutter/material.dart';

class TelaSobre extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Sobre"),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            // Adicione informações sobre os desenvolvedores
            _buildDeveloperInfo("Israel Silvestre Vaz de Lima", "israel.lima.128@ufrn.edu.br"),
            _buildDeveloperInfo("Thiago de Melo Monteiro", "thiago.melo.072@ufrn.edu.br"),
          ],
        ),
      ),
    );
  }

  Widget _buildDeveloperInfo(String name, String email) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 8),
      child: Column(
        children: [
          Text(
            name,
            style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
          ),
          Text(
            email,
            style: TextStyle(fontSize: 16),
          ),
        ],
      ),
    );
  }
}
