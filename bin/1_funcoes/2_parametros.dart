void main() {
  // 1 - Parâmetros Obrigatórios por default

  print('A soma de 10 + 10 é ${somaInteiros(10, 10)}');

  // 2 - Parâmetros Nomeados
  // * Parâmetros nomeados são nullables por default
  // * Parâmetros nomeados podem ser promovidos para non-null com checagem de null

  // Se não passar parâmetro, tudo bem, pois são nomeados
  print('A soma de 10.2 + 10.2 é ${somaDoubles()}');

  // Não pode passar o parâmetro simplesmente, pois o Dart não sabe qual parâmetro é, já que
  // estes são opcionais. Nesse caso, tem que nomear os parâmetros
  // print('A soma de 10.2 + 10.2 é ${somaDoubles(10.2, 10.2)}'); // ! <---- ERRO
  print(
      'A soma de 10.2 + 10.2 é ${somaDoubles(numero1: 10.2, numero2: 10.2)}'); // * <---- OK

  // Parâmetros nomeados NÃO PRECISAM ser passados na ordem. Diferente dos parâmetros
  // obrigatórios, o parâmetro nomeado pode ser na ordem que você quiser,
  // conforme demonstrado abaixo:
  print(
      'A soma de 10.2 + 10.2 é ${somaDoubles(numero2: 10.2, numero1: 10.2)}'); // * <---- OK

  somaDoublesObrigatorios(numero1: 5.2, numero2: 10.2);

  // Parâmetros definidos com required, pode passar na ordem que quiser, porém é obrigado
  // a passar todos definidos com 'required'
  somaDoublesObrigatorios(numero2: 10.2, numero1: 5.2);

  // * OK, pois passou os dois valores
  somaDoublesObrigatorios2(numero1: 5.2, numero2: 10);

  // ! ERRO, pois precisa passar o 1, é required
  // somaDoublesObrigatorios2(numero2: 10);

  // * OK, pois apesar de ser required, aceita null, então explicitamente passando 'null',
  // * dá certo
  somaDoublesObrigatorios2(numero1: null, numero2: 10);

  // ! ERRO. Na função original, se tentar enviar NULL, vai reclamar!
  // somaDoublesObrigatorios(numero2: 10.2, numero1: null);

  // ! ERRO. Assim como o exemplo acima, se tentar enviar NULL
  // ! no parâmetro numero2, vai reclamar!
  // somaDoublesObrigatorios2(numero2: null, numero1: null);

  // * Ao utilizar chamada com parâmetro default utiliza o valor default quando não
  // * passa os parâmetros
  print(somaDoublesDefault());
  print(somaDoublesDefault(numero1: 10));

  // 3 - Parâmetro Opcional
  // * O opcional (utilizando [ e ])significa que não é obrigatório a passar os parâmetros,
  // * mas se passar, tem que ser na ordem
  somaIntOpcional();
  somaIntOpcional(1);
  somaIntOpcional(1, 1);

  // Casos mistos
  parametrosNormaisComNomeados(1, nome: 'Alessandro', idade: 37);
}

int somaInteiros(int numero1, int numero2) {
  return numero1 + numero2;

  parametrosNormaisComOpcionais(1, 'Alessandro Pino');
  parametrosNormaisComOpcionais(1, 'Alessandro Pino', 37);

  // ! IMPORTANTE: Parâmetros nomeados ou parâmetros opcionais têm que ser sempre os últimos
  // ! nas declarações de funções, em sua assinatura
}

// Parâmetros nomeados, por default aceitam nulo
// Então, tem que colocar o '?'
double somaDoubles({double? numero1, double? numero2}) {
  // Também tem que checar se são nulos ou não, pois aí são promovidos para não-nulos
  // Apenas as variáveis de nível superior que não podem ser promovidas a não-nulos
  if (numero1 != null && numero2 != null) {
    return numero1 + numero2;
  }

  return 0.0;
}

// Utilizar a palavra-chave 'required' para obrigar a passar o parâmetro
// Assim, o Dart não deixa colocar '?' onde tem 'required'
double somaDoublesObrigatorios(
    {required double numero1, required double numero2}) {
  return numero1 + numero2;
}

// Nesse caso, utilizando '?', ele é 'required' mas aceita nulo
// Tem que promover a non-nullable
double somaDoublesObrigatorios2(
    {required double? numero1, required double numero2}) {
  // Utilizando null aware operator
  // Se o valor for nulo, vai atribuir zero
  // Senão, vai ignorar a instrução e permanecer o valor atribuído originalmente
  numero1 ??= 0;

  // Utilizando if convencional
  // if (numero1 == null) {
  //  numero1 = 0;
  // }
  return numero1 + numero2;
}

double somaDoublesDefault({double numero1 = 0, double numero2 = 0}) {
  return numero1 + numero2;
}

int somaIntOpcional([int numero1 = 0, int numero2 = 0]) {
  return numero1 + numero2;
}

void parametrosNormaisComNomeados(int numero,
    {required String nome, required int idade}) {}

void parametrosNormaisComOpcionais(int numero, [String? nome, int? idade]) {}
