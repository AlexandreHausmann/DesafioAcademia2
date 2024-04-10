//09:18
import 'dart:math' as math;

void main() {
  // Definindo o comparador de formas
  final comparador = ComparadorFormasGeometricas();

  // Definindo as formas geométricas
  final circuloA = Circulo('Círculo A', 3);
  final circuloB = Circulo('Círculo B', 8);
  final retanguloA = Retangulo('Retângulo A', 4, 3);
  final retanguloB = Retangulo('Retângulo B', 19, 11);
  final trianguloEquilateroA = TrianguloEquilatero('Triângulo Equilátero A', 5);
  final trianguloEquilateroB = TrianguloEquilatero('Triângulo Equilátero B', 7);
  final trianguloRetanguloA = TrianguloRetangulo('Triângulo Retângulo A', 3, 4);
  final trianguloRetanguloB = TrianguloRetangulo('Triângulo Retângulo B', 5, 12);
  final pentagonoRegularA = PentagonoRegular('Pentágono Regular A', 5);
  final pentagonoRegularB = PentagonoRegular('Pentágono Regular B', 7);
  final hexagonoRegularA = HexagonoRegular('Hexágono Regular A', 4);
  final hexagonoRegularB = HexagonoRegular('Hexágono Regular B', 6);

  // Obter formas com maior área e perímetro
  final formaMaiorArea = comparador.formaDeMaiorArea([
    circuloA, circuloB, retanguloA, retanguloB,
    trianguloEquilateroA, trianguloEquilateroB,
    trianguloRetanguloA, trianguloRetanguloB,
    pentagonoRegularA, pentagonoRegularB,
    hexagonoRegularA, hexagonoRegularB,
  ]);

  final formaMaiorPerimetro = comparador.formaDeMaiorPerimetro([
    circuloA, circuloB, retanguloA, retanguloB,
    trianguloEquilateroA, trianguloEquilateroB,
    trianguloRetanguloA, trianguloRetanguloB,
    pentagonoRegularA, pentagonoRegularB,
    hexagonoRegularA, hexagonoRegularB,
  ]);

  // Imprimir os resultados
  print('A maior área é ${formaMaiorArea.area().toStringAsFixed(2)} e pertence a ${formaMaiorArea.nome}');
  print('O maior perímetro é ${formaMaiorPerimetro.perimetro().toStringAsFixed(2)} e pertence a ${formaMaiorPerimetro.nome}');
}

/// Representa uma forma geométrica genérica.
abstract class FormaGeometrica {
  String nome;

  FormaGeometrica(this.nome);

  double area();

  double perimetro();
}

/// Representa a forma geométrica "círculo".
class Circulo implements FormaGeometrica {
  String nome;
  double raio;

  Circulo(this.nome, this.raio);

  @override
  double area() => math.pi * math.pow(raio, 2);

  @override
  double perimetro() => 2 * math.pi * raio;
}

/// Representa a forma geométrica "retângulo".
class Retangulo implements FormaGeometrica {
  String nome;
  double largura;
  double altura;

  Retangulo(this.nome, this.largura, this.altura);

  @override
  double area() => altura * largura;

  @override
  double perimetro() => (altura * 2) + (largura * 2);
}

/// Representa a forma geométrica "triângulo equilátero".
class TrianguloEquilatero implements FormaGeometrica {
  String nome;
  double lado;

  TrianguloEquilatero(this.nome, this.lado);

  @override
  double area() => (math.sqrt(3) / 4) * math.pow(lado, 2);

  @override
  double perimetro() => lado * 3;
}

/// Representa a forma geométrica "triângulo retângulo".
class TrianguloRetangulo implements FormaGeometrica {
  String nome;
  double base;
  double altura;

  TrianguloRetangulo(this.nome, this.base, this.altura);

  @override
  double area() => (base * altura) / 2;

  @override
  double perimetro() => base + altura + math.sqrt(math.pow(base, 2) + math.pow(altura, 2));
}

/// Representa a forma geométrica "pentágono regular".
class PentagonoRegular implements FormaGeometrica {
  String nome;
  double lado;

  PentagonoRegular(this.nome, this.lado);

  @override
  double area() => (0.25) * math.sqrt(5 * (5 + 2 * math.sqrt(5))) * math.pow(lado, 2);

  @override
  double perimetro() => lado * 5;
}

/// Representa a forma geométrica "hexágono regular".
class HexagonoRegular implements FormaGeometrica {
  String nome;
  double lado;

  HexagonoRegular(this.nome, this.lado);

  @override
  double area() => (3 * math.sqrt(3) * math.pow(lado, 2)) / 2;

  @override
  double perimetro() => lado * 6;
}

/// Compara características de formas geométricas.
class ComparadorFormasGeometricas {
  FormaGeometrica formaDeMaiorArea(List<FormaGeometrica> formas) {
    FormaGeometrica maiorArea = formas[0];

    for (var forma in formas) {
      if (forma.area() > maiorArea.area()) {
        maiorArea = forma;
      }
    }

    return maiorArea;
  }

  FormaGeometrica formaDeMaiorPerimetro(List<FormaGeometrica> formas) {
    FormaGeometrica maiorPerimetro = formas[0];

    for (var forma in formas) {
      if (forma.perimetro() > maiorPerimetro.perimetro()) {
        maiorPerimetro = forma;
      }
    }

    return maiorPerimetro;
  }
}
//11:58