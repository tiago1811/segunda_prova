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
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => TelaSobre()),
              );
            },
          ),
        ],
      ),
      body: FutureBuilder<List<Membro>>(
        future: _listaMembros,
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return Center(child: CircularProgressIndicator());
          } else if (snapshot.hasError) {
            return Center(child: Text('Erro ao carregar membros'));
          } else if (!snapshot.hasData || snapshot.data!.isEmpty) {
            return Center(child: Text('Nenhum membro encontrado'));
          } else {
            List<Membro> membros = snapshot.data!;
            return ListView.builder(
              itemCount: membros.length,
              itemBuilder: (context, index) {
                return GestureDetector(
                  onTap: () {
                    _navegarParaTelaDetalhes(membros[index]);
                  },
                  onLongPress: () {
                    _navegarParaTelaAltera(membros[index]);
                  },
                  child: Card(
                    margin: EdgeInsets.symmetric(vertical: 8, horizontal: 10),
                    child: ListTile(
                      title: Text(membros[index].nome),
                      subtitle: Text(membros[index].funcao),
                      leading: CircleAvatar(),
                    ),
                  ),
                );
              },
            );
          }
        },
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
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
