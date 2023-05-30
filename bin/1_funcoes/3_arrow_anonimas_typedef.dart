void main() {
  // Funções Arrow
  print(somaInteirosArrow(10, 10));

  // Funções anônimas
  () {
    print('Funcao Anonima');
  }();
  // * Sem o parênteses ao final, a função anônima está declarada mas não executa.
  // * Com o parêntese a função anônima é executada

  somaInteiros;
  // * Acima, não está fazendo nada. Não está invocando uma função.
  // * Para invocar a função, tem que colocar os parênteses. Assim, analogamente,
  // * também tem que colocar os parênteses ao final da função anônima para ser
  // * invocada.

  // * Uma função anônima é uma função que pode estar jogada ou associada a uma
  // * variável.

  var funcaoQualquer = () {
    print('Chamou a funcao da variavel');
    return '2000';
  };
  // * Acima, foi criada uma 'closure'
  // * Acima, uma variável que recebe uma função

  print(funcaoQualquer());
  // * A função anônima não tem tipo de retorno nem nome, apenas parâmetros

  var variavelTeste = '';

  print(variavelTeste);
  print(funcaoQualquer);
  print(variavelTeste.runtimeType);
  print(funcaoQualquer.runtimeType);

  chamarUmaFuncaoDeUmParametro((nome) {
    if (nome.isEmpty) {
      print('Nome veio vazio');
    } else {
      print(nome);
    }
  });

  // Typedef
}

// * Funções têm 3 partes:
// *    1: Tipo de retorno
// *    2: Nome
// *    3: parâmetros (normais, nomeados, opcionais)
int somaInteiros(int numero1, int numero2) {
  return numero1 + numero2;
}

// * Função Arrow veio para otimizar a estrutura da nossa função
// * Algumas funções conforme a acima são muito simples. Fazem apenas um cálculo
// * e já retornam. Assim, há a possibilidade de fazer a mesma estrutura utilizando
// * uma arrow, conforme exemplo abaixo:
int somaInteirosArrow(int numero1, int numero2) => numero1 + numero2;

// * Ela não tem corpo, o corpo é uma única linha. Não precisa colocar a palavra return
// * O que for executado automaticamente já vai ser retornado
// * No caso de return void, ele sabe que não é pra retornar nada
// * Importante ela ser uma linha só, mas se o nome da função for grande,
// * por exemplo, o editor pode pular uma linha, apesar de fazer parte
// * de uma mesma linha, há a quebra de linha

// * Uma função pode receber uma outra função como parâmetro
// * Function é um tipo

void chamarUmaFuncaoDeUmParametro(Function(String nome) funcaoQueRecebeONome) {
  var calculo = 1 + 1;
  var nomeCompleto = 'Alessandro Pino';

  funcaoQueRecebeONome(nomeCompleto);
}

// * Typedef serve para criar um tipo definido
typedef FuncaoQueRecebeNome = void Function(String nome);
