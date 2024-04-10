class Musica {
  String titulo;
  String artista;
  String album;
  int duracaoSegundos;

  Musica(this.titulo, this.artista, this.album, this.duracaoSegundos);
}

class BibliotecaDeMusicas {
  List<Musica> musicas = [];

  void adicionarMusica(Musica musica) {
    musicas.add(musica);
  }

  void imprimirBiblioteca() {
    print('--- Biblioteca de Músicas ---');
    for (var musica in musicas) {
      print('Título: ${musica.titulo}');
      print('Artista: ${musica.artista}');
      print('Álbum: ${musica.album}');
      print('Duração: ${musica.duracaoSegundos ~/ 60} minutos e ${musica.duracaoSegundos % 60} segundos');
      print('-----------------------------');
    }
    print('Total de músicas: ${musicas.length}');
    int duracaoTotalSegundos = musicas.fold(0, (total, musica) => total + musica.duracaoSegundos);
    double duracaoTotalHoras = duracaoTotalSegundos / 3600;
    print('Duração total: ${duracaoTotalHoras.toStringAsFixed(2)} horas');
  }

  List<Musica> buscarPorTitulo(String titulo) {
    return musicas.where((musica) => musica.titulo.toLowerCase() == titulo.toLowerCase()).toList();
  }

  List<Musica> buscarPorArtista(String artista) {
    return musicas.where((musica) => musica.artista.toLowerCase() == artista.toLowerCase()).toList();
  }

  List<Musica> buscarPorAlbum(String album) {
    return musicas.where((musica) => musica.album.toLowerCase() == album.toLowerCase()).toList();
  }
}

void main() {
  var biblioteca = BibliotecaDeMusicas();

  // Adicionando algumas músicas à biblioteca
  biblioteca.adicionarMusica(Musica('Bohemian Rhapsody', 'Queen', 'A Night at the Opera', 355));
  biblioteca.adicionarMusica(Musica('Stairway to Heaven', 'Led Zeppelin', 'Led Zeppelin IV', 482));
  biblioteca.adicionarMusica(Musica('Hotel California', 'Eagles', 'Hotel California', 390));
  biblioteca.adicionarMusica(Musica('Smells Like Teen Spirit', 'Nirvana', 'Nevermind', 301));
  biblioteca.adicionarMusica(Musica('Imagine', 'John Lennon', 'Imagine', 186));

  // Imprimindo a biblioteca de músicas
  biblioteca.imprimirBiblioteca();

  // Buscando músicas por título
  var musicasPorTitulo = biblioteca.buscarPorTitulo('hotel california');
  print('--- Busca por Título: "Hotel California" ---');
  for (var musica in musicasPorTitulo) {
    print('Título: ${musica.titulo}, Artista: ${musica.artista}, Álbum: ${musica.album}');
  }

  // Buscando músicas por artista
  var musicasPorArtista = biblioteca.buscarPorArtista('Queen');
  print('--- Busca por Artista: "Queen" ---');
  for (var musica in musicasPorArtista) {
    print('Título: ${musica.titulo}, Artista: ${musica.artista}, Álbum: ${musica.album}');
  }

  // Buscando músicas por álbum
  var musicasPorAlbum = biblioteca.buscarPorAlbum('Imagine');
  print('--- Busca por Álbum: "Imagine" ---');
  for (var musica in musicasPorAlbum) {
    print('Título: ${musica.titulo}, Artista: ${musica.artista}, Álbum: ${musica.album}');
  }
}