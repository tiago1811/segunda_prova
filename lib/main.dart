import 'package:flutter/material.dart';

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
  // Lista simulada de membros
  List<String> listaMembros = [
    "Membro 1",
    "Membro 2",
    "Membro 3",
    "Membro 4",
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Tela Home"),
      ),
      body: Container(
        child: ListView.builder(
          itemCount: listaMembros.length,
          itemBuilder: (context, index) {
            return Card(
              margin: EdgeInsets.symmetric(vertical: 8, horizontal: 16),
              child: ListTile(
                title: Text(listaMembros[index]),
                subtitle: Text("Pastor"), // Exemplo de mensagem
                leading: CircleAvatar(
                  child: Text(listaMembros[index][0]),
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
            listaMembros.add("Novo Membro ${listaMembros.length + 1}");
          });
        },
        child: Icon(Icons.add),
      ),
    );
  }
}
