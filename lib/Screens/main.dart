import 'package:flutter/material.dart';
import 'package:segunda_prova/Bd/model.dart';
import 'package:segunda_prova/Screens/login.dart';

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
      home: LoginScreen(),
    );
  }
}

class TelaHome extends StatefulWidget {
  @override
  _TelaHomeState createState() => _TelaHomeState();
}

class _TelaHomeState extends State<TelaHome> {
  List<Membro> listaMembros = [
    Membro.withID(
      id: 1,
      nome: "Edson Moreira",
      funcao: "Pastor",
      imagePath: "edson.png",
    ),
    Membro.withID(
      id: 2,
      nome: "Membro 2",
      funcao: "Missionário",
      imagePath: "caminho/da/imagem2.jpg",
    ),
    Membro.withID(
      id: 3,
      nome: "Membro 3",
      funcao: "Líder de Jovens",
      imagePath: "caminho/da/imagem3.jpg",
    ),
    Membro.withID(
      id: 4,
      nome: "Membro 4",
      funcao: "Diácono",
      imagePath: "caminho/da/imagem4.jpg",
    ),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("GERENCIAMENTO DE MEMBROS"),
      ),
      body: Container(
        child: ListView.builder(
          itemCount: listaMembros.length,
          itemBuilder: (context, index) {
            return Card(
              margin: EdgeInsets.symmetric(vertical: 8, horizontal: 16),
              child: ListTile(
                title: Text(listaMembros[index].nome),
                subtitle: Text(listaMembros[index].funcao),
                leading: CircleAvatar(
                  backgroundImage: AssetImage(listaMembros[index].imagePath),
                ),
                onTap: () {
                  // Adicione a lógica de navegação ou ação ao tocar no card aqui
                },
              ),
            );
          },
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          // Adiciona um novo membro à lista quando o botão é pressionado
          setState(() {
            listaMembros.add(
              Membro.withID(
                id: listaMembros.length + 1,
                nome: "Novo Membro ${listaMembros.length + 1}",
                funcao: "Função",
                imagePath: "caminho/da/nova/imagem.jpg",
              ),
            );
          });
        },
        child: Icon(Icons.add),
      ),
    );
  }
}
