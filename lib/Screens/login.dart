import 'package:flutter/material.dart';
import 'package:segunda_prova/Screens/main.dart';

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
                  Colors.grey.shade900,
                  Colors.grey.shade800,
                  Colors.grey.shade700,
                ],
              ),
            ),
          ),
          // Conteúdo da Tela
          Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                SizedBox(
                  width: 200,
                  height: 50,
                  child: ElevatedButton(
                    style: ElevatedButton.styleFrom(
                      foregroundColor: Colors.white,
                      backgroundColor: Colors.grey[800],
                    ),
                    onPressed: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(builder: (context) => TelaHome()),
                      );
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
