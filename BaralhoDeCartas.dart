//12:35
import 'dart:collection';

void main() {
  // Criando o baralho
  final baralho = Queue<Carta>();

  // Incluindo as cartas no baralho na ordem especificada
  baralho.add(Carta('A', 'paus'));
  baralho.add(Carta('A', 'copas'));
  baralho.add(Carta('A', 'espadas'));
  baralho.add(Carta('A', 'ouros'));

  // Removendo todas as cartas do baralho seguindo a regra definida
  while (baralho.isNotEmpty) {
    final cartaRemovida = baralho.removeFirst();
    print('Carta removida: ${cartaRemovida.valor} de ${cartaRemovida.naipe}');
  }
}

class Carta {
  final String valor;
  final String naipe;

  Carta(this.valor, this.naipe) {
    if (!['paus', 'copas', 'espadas', 'ouros'].contains(naipe)) {
      throw ArgumentError('Naipe inválido.');
    }
  }
}
//13:20