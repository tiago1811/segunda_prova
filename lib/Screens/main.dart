import 'package:flutter/material.dart';
import 'package:segunda_prova/Screens/TelaAltera.dart';
import 'package:segunda_prova/Screens/TelaCadastro.dart';
import 'package:segunda_prova/Screens/TelaDetalhes.dart';
import 'package:segunda_prova/Screens/TelaSobre.dart';
import 'package:segunda_prova/domain/membro.dart';
import 'package:segunda_prova/helpers/membro_helper.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(
        brightness: Brightness.dark,
      ),
      home: TelaHome(),
    );
  }
}

class TelaHome extends StatefulWidget {
  @override
  _TelaHomeState createState() => _TelaHomeState();
}

class _TelaHomeState extends State<TelaHome> {
  late Future<List<Membro>> _listaMembros;
  @override
  void initState() {
    super.initState();
    _listaMembros = _carregarMembros();
  }

  Future<List<Membro>> _carregarMembros() async {
    return await MembroHelper().getAll();
  }

  // Método para navegar para a TelaDetalhes
  void _navegarParaTelaDetalhes(Membro membro) {
    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) => TelaDetalhes(membro: membro),
      ),
    );
  }

  // Método para navegar para a TelaAltera
  void _navegarParaTelaAltera(Membro membro) {
    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) => TelaAltera(membro: membro),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("GERENCIAMENTO DE MEMBROS"),
        actions: [
          IconButton(
            icon: Icon(Icons.info),
            onPressed: () {
              // Navegar para o TelaSobre
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => TelaSobre()),
              );
            },
          ),
        ],
      ),
      body: Container(
        child: ListView.builder(
          itemCount: _listaMembros.length,
          itemBuilder: (context, index) {
            return GestureDetector(
              onTap: () {
                // Chamar TelaDetalhes com os dados do membro selecionado ao toque simples
                _navegarParaTelaDetalhes(_listaMembros[index]);
              },
              onLongPress: () {
                // Chamar TelaAltera com os dados do membro selecionado ao toque longo
                _navegarParaTelaAltera(_listaMembros[index]);
              },
              child: Card(
                margin: EdgeInsets.symmetric(vertical: 8, horizontal: 10),
                child: ListTile(
                  title: Text(_listaMembros[index].nome),
                  subtitle: Text(_listaMembros[index].funcao),
                  leading: CircleAvatar(
                      //backgroundImage: AssetImage(listaMembros[index].imagePath),
                      ),
                ),
              ),
            );
          },
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          // Navegar para a TelaCadastro
          Navigator.push(
            context,
            MaterialPageRoute(builder: (context) => TelaCadastro()),
          );
        },
        child: Icon(Icons.add),
      ),
    );
  }
}
