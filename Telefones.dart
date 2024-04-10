//9:00
import 'dart:math' as math; // Importando a biblioteca math e a renomeando para evitar conflitos de nome

void main() {
  final meioDeComunicacao = aleatorio(); // Chamando a função aleatorio para obter um meio de comunicação aleatório
  meioDeComunicacao.fazerLigacao('(47) 99876-5432'); // Fazendo uma ligação utilizando o meio de comunicação escolhido
}

MeioDeComunicacao aleatorio() {
  final meiosDeComunicacao = <MeioDeComunicacao>[ // Lista de meios de comunicação disponíveis
    Telefone(),
    Celular(),
    Orelhao(),
  ];

  final random = math.Random(); // Gerador de números aleatórios

  return meiosDeComunicacao[random.nextInt( // Escolhendo aleatoriamente um meio de comunicação da lista
    meiosDeComunicacao.length,
  )];
}

// Classe abstrata que define o comportamento de um meio de comunicação
abstract class MeioDeComunicacao {
  void fazerLigacao(String numero); // Método abstrato para fazer uma ligação
}

// Implementação da classe Telefone
class Telefone extends MeioDeComunicacao {
  @override
  void fazerLigacao(String numero) {
    print('[TELEFONE] Ligando para $numero...'); // Realiza a ligação utilizando um telefone
  }
}

// Implementação da classe Celular
class Celular extends MeioDeComunicacao {
  @override
  void fazerLigacao(String numero) {
    print('[CELULAR] Ligando para $numero...'); // Realiza a ligação utilizando um celular
  }
}

// Implementação da classe Orelhao
class Orelhao extends MeioDeComunicacao {
  @override
  void fazerLigacao(String numero) {
    print('[ORELHÃO] Ligando para $numero...'); // Realiza a ligação utilizando um orelhão
  }
}

//9:12
