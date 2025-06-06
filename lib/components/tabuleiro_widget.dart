import 'package:campo_minado/components/campo_widget.dart';
import 'package:campo_minado/models/campo.dart';
import 'package:campo_minado/models/tabuleiro.dart';
import 'package:flutter/material.dart';

class TabuleiroWidget extends StatelessWidget {

  final Tabuleiro tabuleiro;
  final void Function(Campo) onAbrir;
  final void Function(Campo) onAlterarMarcacao;
  const TabuleiroWidget({
    super.key, 
    required this.tabuleiro, 
    required this.onAbrir, 
    required this.onAlterarMarcacao
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      child: GridView.count(
        crossAxisCount: tabuleiro.colunas,
        children: tabuleiro.campos.map(
          (c)=> CampoWidget(
            campo: c, 
            onAbrir: onAbrir, 
            onAlterarMarcacao: onAlterarMarcacao,
          )
        ).toList()
      ),
    );
  }
}