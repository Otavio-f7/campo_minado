import 'dart:math';

import 'package:campo_minado/models/campo.dart';

class Tabuleiro {
  final int linhas;
  final int colunas;
  final int qtdeBomabas;
  final List<Campo> _campos = [];

  Tabuleiro({
    required this.linhas, 
    required this.colunas, 
    required this.qtdeBomabas
  }) {
    _criarCampos();
    _relacionarVizinhos();
    _sortearMinas();
  }
  
  void reiniciar(){
    _campos.forEach((c)=> c.reiniciar());
    _sortearMinas();
  }
  void reverlarBombas(){
    _campos.forEach((c)=> c.revelarBombas());
  }
  void _criarCampos() {
    for(var l = 0; l< linhas; l++){
      for(var c = 0; c< colunas; c++){
        _campos.add(Campo(linha: l, coluna: c));
      }
    }
  }
  
  void _relacionarVizinhos() {
    for(var campo in _campos){
      for(var vizinho in _campos){
        campo.adicionarVizinho(vizinho);
      }
    }
  }

  void _sortearMinas(){
    int sorteadas = 0;
    if(qtdeBomabas>linhas * colunas){
      return;
    }
    while(sorteadas < qtdeBomabas){
      int i = Random().nextInt(_campos.length);

      if(!_campos[i].minado){
        sorteadas++;
        _campos[i].minar();
      }
    }
  }

  List<Campo> get campos => _campos;

  bool get resolvido=> _campos.every((c)=> c.resolvido);
  
}