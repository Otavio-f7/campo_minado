import 'package:campo_minado/models/tabuleiro.dart';
import 'package:flutter_test/flutter_test.dart';

main(){
  group('Tabuleiro',(){
    test('Ganhar', () {
      Tabuleiro tabuleiro = Tabuleiro(
        linhas: 2, 
        colunas: 2, 
        qtdeBomabas: 0,
      );

      tabuleiro.campos[0].minar();
      tabuleiro.campos[3].minar();

      tabuleiro.campos[0].alternarMarcacao();
      tabuleiro.campos[1].abrir();
      tabuleiro.campos[2].abrir();
      tabuleiro.campos[3].alternarMarcacao();

      expect(tabuleiro.resolvido, isTrue);
    });
  });
}