import 'dart:math';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class Game extends StatefulWidget {
  const Game({Key? key}) : super(key: key);

  @override
  _GameState createState() => _GameState();
}

class _GameState extends State<Game> {

  //Variaveis
  final Map<Color,String> cores = {
    Colors.black:"Preto",
    Colors.red:"Vermelho",
    Colors.blue:"Azul",
    Colors.green:"Verde",
    Colors.deepPurple: "Roxo",
    Colors.amber:"Amarelo",
    Colors.brown:"Marrom",
    Colors.deepOrangeAccent:"Laranja",
    Colors.pinkAccent:"Rosa",
  };
  List<String> opcaoCores = [];
  //late List<String> coresSelecionadas;
  var _cor;
  String _nomeCor="";

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
    return Container(
      child: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            _corBox(),
            SizedBox(height: MediaQuery.of(context).size.height * 0.01,),
            _texto(),
            SizedBox(height: MediaQuery.of(context).size.height * 0.01,),
            _Opcoes(),
            SizedBox(height: MediaQuery.of(context).size.height * 0.01,),
          ],
        ),
      ),
    );
  }

  _corBox(){
    return Container(
      margin: EdgeInsetsDirectional.all(10),
      height: MediaQuery.of(context).size.height * 0.2,
      width: MediaQuery.of(context).size.width * 0.5,
      decoration: BoxDecoration(
        color: _cor,
          borderRadius: BorderRadius.all(Radius.circular(20)),
      ),
    );
  }

  _texto(){
    return Text(
      "Que cor é essa?",
          style: TextStyle(
            fontSize: 20,
          ),
    );
  }

  _Opcoes(){
    return Container(
      height: MediaQuery.of(context).size.height * 0.2,
        width: MediaQuery.of(context).size.width * 0.5,
        child: ListView.builder(
          itemCount: opcaoCores.length,
          itemBuilder: (context, index){
             return _botaoOpcao(opcaoCores[index]);
            },
        ),
    );
  }

  _botaoOpcao(String valor){
    return ElevatedButton(
      onPressed: (){
        setState(() {
          verificar(valor);
        });
      },
      child: Text(valor),
    );
  }

  //Funções

  String opcaoValor(){
    String resultado = "";

    List<String> opcoes = opcaoCores;
    int random = new Random().nextInt(opcoes.length);
    String opcao = opcoes.elementAt(random);
    resultado = opcao;
    opcoes.removeAt(random);

    return resultado;
  }

  verificar(String valor){
      if(_nomeCor.toUpperCase() == valor.toUpperCase()){
        listarOpcoes();
        return ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(
            behavior: SnackBarBehavior.floating,
            content: const Text('Boa! Você acertou! 😁'),
            backgroundColor: Colors.green,
            duration: Duration(seconds: 1),
          ),
        );
      }else{
        //listarOpcoes();
        return ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(
            behavior: SnackBarBehavior.floating,
            content: const Text('Poxa, você errou 😔'),
            backgroundColor: Colors.red,
            duration: Duration(seconds: 1),
          ),
        );
      }
  }

  void initState() {
    super.initState();
    WidgetsBinding.instance!.addPostFrameCallback((_) => listarOpcoes());
  }

  void listarOpcoes(){
    var mapCor = cores.entries.elementAt(new Random().nextInt(cores.length));
    setState(() {
      _cor = mapCor.key;
      _nomeCor = mapCor.value;
    });

    List<String> opcoes = [];
    opcoes.add(_nomeCor);
    opcoes.add(cores.values.elementAt(new Random().nextInt(cores.length)));
    opcoes.add(cores.values.elementAt(new Random().nextInt(cores.length)));
    opcoes = new List.generate(3, (index) => opcoes[Random().nextInt(opcoes.length)]);
    opcoes = opcoes.toSet().toList();

    if(opcoes.length == 3){
      setState(() {
        opcaoCores = opcoes;
      });
    }else{
      listarOpcoes();
    }
  }

}
