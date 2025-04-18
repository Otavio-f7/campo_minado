import 'package:campo_minado/components/campo_widget.dart';
import 'package:campo_minado/components/resultado_widget.dart';
import 'package:campo_minado/components/tabuleiro_widget.dart';
import 'package:campo_minado/models/campo.dart';
import 'package:campo_minado/models/explosao_exception.dart';
import 'package:campo_minado/models/tabuleiro.dart';
import 'package:flutter/material.dart';

class CampoMinadoApp extends StatefulWidget {
  const CampoMinadoApp({super.key});

  @override
  State<CampoMinadoApp> createState() => _CampoMinadoAppState();
}

class _CampoMinadoAppState extends State<CampoMinadoApp> {

  bool? _venceu;
  Tabuleiro? _tabuleiro;
  _reiniciar(){
    setState(() {
      _venceu = null;
      _tabuleiro!.reiniciar();
    });
  }

  void _abrir(Campo c){
    if(_venceu != null){return;}
    setState(() {
      try{
        c.abrir();
        if(_tabuleiro!.resolvido){
          _venceu = true;
        }
      }on ExplosaoException {
          _venceu = false;
          _tabuleiro!.reverlarBombas();
      }
    });
  }

  void _alterarMarcacao(Campo c){
    if(_venceu != null){return;}
    setState(() {
      c.alternarMarcacao();
      if(_tabuleiro!.resolvido){
         _venceu = true;
      }
    });
  }

  Tabuleiro? _getTabuleito(double largura, double altura){
    if(_tabuleiro == null){
      int qtdeColunas = 15;
      double tamanhoCampo = largura / qtdeColunas;
      int qtdeLinhas = (altura / tamanhoCampo).floor();
      _tabuleiro = Tabuleiro(
        linhas: qtdeLinhas, 
        colunas: qtdeColunas, 
        qtdeBomabas: 50
      );
    }
    return _tabuleiro;
  }

  @override
  Widget build(BuildContext context) {
    

    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        appBar: ResultadoWidget(
          venceu: _venceu, 
          onReiniciar:_reiniciar,
        ),
        body: Container(
          color: Colors.grey,
          child: LayoutBuilder(
            builder: (ctx, constraints){
              return TabuleiroWidget(
                tabuleiro: _getTabuleito(
                  constraints.maxWidth, 
                  constraints.maxHeight
                )!, 
                onAbrir: _abrir, 
                onAlterarMarcacao: _alterarMarcacao
              );
            }
          ),
        ),
      ),
    );
  }
}