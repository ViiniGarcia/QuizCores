import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:quiz_cores/Game.dart';

class Menu extends StatefulWidget {
  const Menu({Key? key}) : super(key: key);

  @override
  _MenuState createState() => _MenuState();
}

class _MenuState extends State<Menu> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: _appBar("Quiz das Cores"),
      body: _corpo(),
    );
  }

  //Widgets

  _appBar(String valor){
    return AppBar(
      title: Text(valor),
      elevation: 0,
    );
  }

  _corpo(){
    return Center(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            _titulo("Quiz das Cores!"),
            SizedBox(height: MediaQuery.of(context).size.height * 0.05,),
            _imagem(),
            SizedBox(height: MediaQuery.of(context).size.height * 0.05,),
            _botao(),
          ],
        ),
    );
  }

  _titulo(String valor){
    return Text(
      valor,
      style:TextStyle(
        color: Colors.blueGrey,
        fontSize: 30,
        fontWeight: FontWeight.bold,
      ),
    );
  }

  _botao(){
    return ElevatedButton(
        onPressed: trocaTela,
        child: Text("Começar"),
    );
  }

  _imagem(){
    return Image.asset(
        'images/ColorWheel.png',
      height: MediaQuery.of(context).size.height * 0.3,
    );
  }

  //Funções
  trocaTela(){
    return Navigator.push(
        context,
        MaterialPageRoute(builder: (context) => Game()),
    );
  }
}
