//09:20
import 'dart:math'; // Importação da biblioteca math para utilizar a classe Random

void main() {
  final pessoa = Pessoa(); // Instanciando um objeto da classe Pessoa
  final fornecedores = [ // Lista de fornecedores disponíveis
    FornecedorDeBebidas(),
    FornecedorDeSanduiches(),
    FornecedorDeBolos(),
    FornecedorDeSaladas(),
    FornecedorDePetiscos(),
    FornecedorUltraCaloricos(),
  ];

  // Loop para consumo de produtos até que a pessoa esteja satisfeita
  while (!pessoa.satisfeita) {
    final fornecedor = fornecedores[Random().nextInt(fornecedores.length)]; // Escolha aleatória de um fornecedor
    final produto = fornecedor.fornecer(); // Obtenção de um produto do fornecedor escolhido
    pessoa.consumir(produto); // Consumo do produto pela pessoa
  }

  pessoa.mostrarInformacoes(); // Exibição das informações da pessoa após a satisfação
}

// Classe que representa um produto
class Produto {
  Produto(this.nome, this.calorias);

  final String nome;
  final int calorias;
}

// Interface que define o comportamento de um fornecedor
abstract class Fornecedor {
  Produto fornecer(); // Método para fornecer um produto
}

// Classe que representa uma pessoa
class Pessoa {
  int caloriasConsumidas = Random().nextInt(3000); // Calorias consumidas pela pessoa
  int refeicoesRealizadas = 0; // Número de refeições realizadas pela pessoa

  // Verifica se a pessoa está satisfeita com a quantidade de calorias consumidas
  bool get satisfeita =>
      caloriasConsumidas > 1800 && caloriasConsumidas <= 2500;

  // Método para consumir um produto
  void consumir(Produto produto) {
    caloriasConsumidas += produto.calorias;
    refeicoesRealizadas++;
  }

  // Método para mostrar as informações da pessoa
  void mostrarInformacoes() {
    print('Calorias consumidas: $caloriasConsumidas');
    print('Número de refeições realizadas: $refeicoesRealizadas');
    print('Status de calorias: ${_getStatusCalorias()}');
  }

  // Método privado para obter o status das calorias consumidas
  String _getStatusCalorias() {
    if (caloriasConsumidas <= 500) {
      return 'Deficit extremo de calorias';
    } else if (caloriasConsumidas <= 1800) {
      return 'Deficit de calorias';
    } else if (caloriasConsumidas <= 2500) {
      return 'Pessoa está satisfeita';
    } else {
      return 'Excesso de calorias';
    }
  }
}

// Classes de fornecedores específicos que implementam a interface Fornecedor
class FornecedorDeBebidas implements Fornecedor {
  final _random = Random();
  final _bebidasDisponiveis = <Produto>[
    Produto('Agua', 0),
    Produto('Refrigerante', 200),
    Produto('Suco de fruta', 100),
    Produto('Energetico', 135),
    Produto('Cafe', 60),
    Produto('Cha', 35),
  ];

  @override
  Produto fornecer() {
    return _bebidasDisponiveis[_random.nextInt(_bebidasDisponiveis.length)];
  }
}

class FornecedorDeSanduiches implements Fornecedor {
  final _random = Random();
  final _sanduichesDisponiveis = <Produto>[
    Produto('Sanduiche de frango', 400),
    Produto('Sanduiche de carne', 500),
    Produto('Sanduiche de peixe', 450),
    Produto('Sanduiche vegetariano', 350),
  ];

  @override
  Produto fornecer() {
    return _sanduichesDisponiveis[
        _random.nextInt(_sanduichesDisponiveis.length)];
  }
}

class FornecedorDeBolos implements Fornecedor {
  final _random = Random();
  final _bolosDisponiveis = <Produto>[
    Produto('Bolo de chocolate', 600),
    Produto('Bolo de cenoura', 550),
    Produto('Bolo de laranja', 500),
    Produto('Bolo de limao', 450),
  ];

  @override
  Produto fornecer() {
    return _bolosDisponiveis[_random.nextInt(_bolosDisponiveis.length)];
  }
}

class FornecedorDeSaladas implements Fornecedor {
  final _random = Random();
  final _saladasDisponiveis = <Produto>[
    Produto('Salada Caesar', 200),
    Produto('Salada de frutas', 150),
    Produto('Salada de legumes', 100),
    Produto('Salada verde', 50),
  ];

  @override
  Produto fornecer() {
    return _saladasDisponiveis[_random.nextInt(_saladasDisponiveis.length)];
  }
}

class FornecedorDePetiscos implements Fornecedor {
  final _random = Random();
  final _petiscosDisponiveis = <Produto>[
    Produto('Batata frita', 300),
    Produto('Frango a passarinho', 400),
    Produto('Caldinho de feijao', 250),
    Produto('Queijo coalho', 200),
  ];

  @override
  Produto fornecer() {
    return _petiscosDisponiveis[_random.nextInt(_petiscosDisponiveis.length)];
  }
}

class FornecedorUltraCaloricos implements Fornecedor {
  final _random = Random();
  final _produtosDisponiveis = <Produto>[
    Produto('Hamburguer duplo', 800),
    Produto('Pizza inteira', 1200),
    Produto('Lasanha', 1000),
    Produto('Sorvete de massa', 700),
  ];

  @override
  Produto fornecer() {
    return _produtosDisponiveis[
        _random.nextInt(_produtosDisponiveis.length)];
  }
}

//10:35
