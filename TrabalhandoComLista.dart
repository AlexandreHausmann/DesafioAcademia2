//8:10
import 'dart:math';

void main() {
  // Instanciando a classe ListaDeCompras
  final listaDeCompras = ListaDeCompras();

  // Incluindo novos itens desejados
  listaDeCompras.incluirItem('Arroz', 2);
  listaDeCompras.incluirItem('Feijão', 1);
  listaDeCompras.incluirItem('Macarrão', 3);

  // Marcando itens como comprados
  listaDeCompras.marcarComoComprado('Arroz');
  listaDeCompras.marcarComoComprado('Feijão');

  // Marcando um item como sem estoque
  listaDeCompras.semEstoque('Macarrão');

  // Exibindo os itens desejados com suas quantidades
  listaDeCompras.exibirItensDesejados();

  // Escolhendo um item pendente aleatoriamente
  print('Item pendente escolhido aleatoriamente: ${listaDeCompras.escolherItemPendente()}');

  // Mostrando o indicador de progresso
  listaDeCompras.mostrarProgresso();
}

class ListaDeCompras {
  // Mapa para armazenar os itens desejados e suas quantidades
  Map<String, int> itensDesejados = {};

  // Conjunto para armazenar os itens já comprados
  Set<String> itensComprados = {};

  // Conjunto para armazenar os itens sem estoque
  Set<String> itensSemEstoque = {};

  // Método para incluir um item desejado na lista de compras
  void incluirItem(String nomeItem, int quantidade) {
    itensDesejados[nomeItem] = quantidade;
  }

  // Método para marcar um item como comprado
  void marcarComoComprado(String nomeItem) {
    if (itensDesejados.containsKey(nomeItem)) {
      itensComprados.add(nomeItem);
      itensDesejados.remove(nomeItem);
    } else {
      print('$nomeItem não está na lista de itens desejados.');
    }
  }

  // Método para marcar um item como sem estoque
  void semEstoque(String nomeItem) {
    if (itensDesejados.containsKey(nomeItem)) {
      itensSemEstoque.add(nomeItem);
      itensDesejados.remove(nomeItem);
    } else {
      print('$nomeItem não está na lista de itens desejados.');
    }
  }

  // Método para exibir os itens desejados com suas quantidades
  void exibirItensDesejados() {
    print('Itens desejados:');
    itensDesejados.forEach((nomeItem, quantidade) {
      print('$nomeItem: $quantidade');
    });
  }

  // Método para escolher aleatoriamente um item pendente
  String escolherItemPendente() {
    final itensPendentes = itensDesejados.keys.toList();
    if (itensPendentes.isNotEmpty) {
      final random = Random();
      final index = random.nextInt(itensPendentes.length);
      return itensPendentes[index].toString();
    } else {
      return 'Nenhum item pendente.';
    }
  }

  // Método para mostrar o progresso da lista de compras
  void mostrarProgresso() {
    final totalItens = itensDesejados.length + itensComprados.length;
    print('Progresso: ${itensComprados.length}/$totalItens');
  }
}
//09:00