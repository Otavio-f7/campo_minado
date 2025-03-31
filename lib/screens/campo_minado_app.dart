import 'package:campo_minado/components/campo_widget.dart';
import 'package:campo_minado/components/resultado_widget.dart';
import 'package:campo_minado/models/campo.dart';
import 'package:campo_minado/models/explosao_exception.dart';
import 'package:flutter/material.dart';

class CampoMinadoApp extends StatelessWidget {
  const CampoMinadoApp({super.key});

  _reiniciar(){
    print('Reiniciar');
  }
  void _abrir(Campo c){
    print('Abrir');
  }
  void _alterarMarcacao(Campo c){
    print('Alterar Marcacao');
  }

  

  @override
  Widget build(BuildContext context) {
    Campo viz1 = Campo(linha: 1, coluna: 0);
    viz1.minar();
    Campo viz2 = Campo(linha: 1, coluna: 0);
    viz2.minar();
    Campo campo = Campo(linha: 0, coluna: 0);
    campo.adicionarVizinho(viz1);
    campo.adicionarVizinho(viz2);
    try{
      // campo.minar();
      campo.alternarMarcacao();

    } on ExplosaoException {}

    return MaterialApp(
      home: Scaffold(
        appBar: ResultadoWidget(
          venceu: true, 
          onReiniciar:_reiniciar,
        ),
        body: Container(
          child: CampoWidget(
            campo: campo, 
            onAbrir: _abrir, 
            onAlterarMarcacao: _alterarMarcacao
          ),
        ),
      ),
    );
  }
}