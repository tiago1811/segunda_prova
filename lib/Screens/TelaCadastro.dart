import 'package:flutter/material.dart';
import 'package:segunda_prova/Bd/model.dart';

class TelaCadastro extends StatefulWidget {
  @override
  _TelaCadastroState createState() => _TelaCadastroState();
}

class _TelaCadastroState extends State<TelaCadastro> {
  final _formKey = GlobalKey<FormState>();

  // Controladores para os campos do formulário
  final TextEditingController _nomeController = TextEditingController();
  final TextEditingController _funcaoController = TextEditingController();
  final TextEditingController _imagePathController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Cadastro de Membro'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Form(
          key: _formKey,
          child: Column(
            children: [
              TextFormField(
                controller: _nomeController,
                decoration: InputDecoration(labelText: 'Nome'),
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Por favor, informe o nome.';
                  }
                  return null;
                },
              ),
              TextFormField(
                controller: _funcaoController,
                decoration: InputDecoration(labelText: 'Função'),
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Por favor, informe a função.';
                  }
                  return null;
                },
              ),
              TextFormField(
                controller: _imagePathController,
                decoration: InputDecoration(labelText: 'Caminho da Imagem'),
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Por favor, informe o caminho da imagem.';
                  }
                  return null;
                },
              ),
              SizedBox(height: 20),
              ElevatedButton(
                onPressed: () {
                  if (_formKey.currentState?.validate() == true) {
                    // Dados válidos, realizar o cadastro
                    _cadastrarMembro();
                  }
                },
                child: Text('Cadastrar'),
              ),
            ],
          ),
        ),
      ),
    );
  }

  void _cadastrarMembro() {
    // Simulação de salvamento no banco de dados
    Membro novoMembro = Membro(
      nome: _nomeController.text,
      funcao: _funcaoController.text,
      imagePath: _imagePathController.text,
    );

    // Exibindo SnackBar
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: Text('Cadastro realizado com sucesso!'),
      ),
    );

    // Navegar para a TelaHome após o cadastro
    Navigator.of(context).pushReplacement(
      MaterialPageRoute(
        builder: (context) => TelaHome(),
      ),
    );
  }
}

class TelaHome extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Tela Home'),
      ),
      body: Center(
        child: Text('Conteúdo da Tela Home'),
      ),
    );
  }
}