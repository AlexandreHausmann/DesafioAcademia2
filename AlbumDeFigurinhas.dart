import 'dart:math';

void main() {
  // Criando o álbum de figurinhas
  final album = Album();

  // Gerando novos pacotes de figuras e adicionando ao álbum até que esteja completo
  while (!album.estaCompleto()) {
    final pacote = PacoteFiguras.gerarPacote();
    album.adicionarPacote(pacote);
  }

  // Imprimindo o número de figuras repetidas
  print('Número de figuras repetidas: ${album.figurasRepetidas.length}');

  // Imprimindo o álbum completo
  album.imprimirAlbum();
}

class Figura {
  final String nome;
  final int codigo;

  Figura(this.nome, this.codigo);
}

class PacoteFiguras {
  static List<Figura> figurasDisponiveis = [
    Figura('Figura 1', 1),
    Figura('Figura 2', 2),
    Figura('Figura 3', 3),
    Figura('Figura 4', 4),
    Figura('Figura 5', 5),
    Figura('Figura 6', 6),
    Figura('Figura 7', 7),
    Figura('Figura 8', 8),
    Figura('Figura 9', 9),
    Figura('Figura 10', 10),
    Figura('Figura 11', 11),
    Figura('Figura 12', 12),
    Figura('Figura 13', 13),
    Figura('Figura 14', 14),
    Figura('Figura 15', 15),
    Figura('Figura 16', 16),
    Figura('Figura 17', 17),
    Figura('Figura 18', 18),
    Figura('Figura 19', 19),
    Figura('Figura 20', 20),
  ];

  static List<Figura> gerarPacote() {
    final pacote = <Figura>[];
    final random = Random();
    for (int i = 0; i < 4; i++) {
      final figura = figurasDisponiveis[random.nextInt(figurasDisponiveis.length)];
      pacote.add(figura);
    }
    return pacote;
  }
}

class Album {
  List<Figura> figurasColadas = [];
  List<Figura> figurasRepetidas = [];

  bool estaCompleto() {
    return figurasColadas.length == PacoteFiguras.figurasDisponiveis.length;
  }

  void adicionarPacote(List<Figura> pacote) {
    for (final figura in pacote) {
      if (!figurasColadas.contains(figura)) {
        figurasColadas.add(figura);
      } else {
        figurasRepetidas.add(figura);
      }
    }
  }

  void imprimirAlbum() {
    figurasColadas.sort((a, b) => a.codigo.compareTo(b.codigo));
    for (final figura in figurasColadas) {
      print('${figura.codigo}: ${figura.nome}');
    }
  }
}