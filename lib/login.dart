import 'package:flutter/material.dart';
class LoginScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          // Gradiente de fundo
          Container(
            decoration: BoxDecoration(
              gradient: LinearGradient(
                begin: Alignment.topCenter,
                end: Alignment.bottomCenter,
                colors: [
                  Colors.grey.shade900, // Cor do topo
                  Colors.grey.shade800, // Cor do meio
                  Colors.grey.shade700, // Cor do fundo
                ],
              ),
            ),
          ),
          // Conteúdo da Tela
          Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                // Adicione outros widgets conforme necessário
                // ...
                // Botão "ENTRAR"
                SizedBox(
                  width: 200, // Ajuste o tamanho conforme necessário
                  height: 50, // Ajuste o tamanho conforme necessário
                  child: ElevatedButton(
                    style: ElevatedButton.styleFrom(
                      primary: Colors.grey[800], // Cor de fundo cinza escuro
                      onPrimary: Colors.white, // Cor do texto branco
                    ),
                    onPressed: () {
                      // Adicione a lógica para o botão "ENTRAR" aqui
                    },
                    child: Text('ENTRAR'),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
