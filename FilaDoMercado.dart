import 'dart:collection';
import 'dart:math';

void main() {
  // Criando a fila do mercado
  final filaMercado = FilaMercado();

  // Populando a fila com 10 pessoas
  for (int i = 0; i < 10; i++) {
    final nomeAleatorio = GeradorNomes().gerarNomeAleatorio();
    filaMercado.entrarFila(nomeAleatorio);
  }

  // Atendendo as pessoas da fila
  while (filaMercado.isNotEmpty) {
    final pessoaAtendida = filaMercado.atender();
    print('$pessoaAtendida foi atendido(a)');
  }
}

class FilaMercado {
  final Queue<String> fila = Queue<String>();

  void entrarFila(String nome) {
    fila.add(nome);
    print('($nome) entrou na fila');
  }

  String atender() {
    if (fila.isNotEmpty) {
      return fila.removeFirst();
    } else {
      return 'Fila vazia';
    }
  }

  bool get isNotEmpty => fila.isNotEmpty;
}

class GeradorNomes {
  final Random _random = Random();

  String gerarNomeAleatorio() {
    final List<String> nomes = [
      'Fulano', 'Ciclano', 'Beltrano', 'José', 'Maria', 'João', 'Ana', 'Pedro', 'Mariana', 'Paulo'
    ];
    final List<String> sobrenomes = [
      'Silva', 'Santos', 'Oliveira', 'Souza', 'Pereira', 'Ferreira', 'Almeida', 'Carvalho', 'Rodrigues', 'Gomes'
    ];

    final nome = nomes[_random.nextInt(nomes.length)];
    final sobrenome = sobrenomes[_random.nextInt(sobrenomes.length)];

    return '$nome $sobrenome';
  }
}
