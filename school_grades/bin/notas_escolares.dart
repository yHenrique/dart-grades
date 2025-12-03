import "dart:io";

void main() {
  List<String> nomesAlunos = [];
  List<List<double>> notasAlunos = [];

  menu(nomesAlunos, notasAlunos);
}

void registrar(List<String> nomesAlunos, List<List<double>> notasAlunos) {
  List<double> notas = [];

  print("Digite o nome do aluno:");
  String nome = stdin.readLineSync()!;

  if (nome != "") {
    nomesAlunos.add(nome);
  }

  String nota = "";

  do {
    print("Digite uma nota para o aluno (ou \"fim\" para terminar)");
    nota = stdin.readLineSync()!;

    if (nota != "fim") {
      notas.add(double.parse(nota));
    }
    
  } while (nota != "fim");

  notasAlunos.add(notas);
}

double media(List<double> notasAlunos) {
  double soma = 0;

  for (double nota in notasAlunos) {
    soma += nota;
  }

  return soma / notasAlunos.length;
}

void exibeInfo(List<String> nomesAlunos, List<List<double>> notasAlunos) {
  for (int i = 0; i < nomesAlunos.length; i++) {
    print("Nome do Aluno: ${nomesAlunos[i]}");
    print("Média do Aluno: ${media(notasAlunos[i])}");
  }
}

void menu(List<String> nomesAlunos, List<List<double>> notasAlunos) {
  print("");
  cabecalho();
  print("");
  print("Escolha uma ação: registrar, listar, sair");
  print("");
  String entrada = stdin.readLineSync()!;

  switch (entrada) {
    case "registrar":
    registrar(nomesAlunos, notasAlunos);
    menu(nomesAlunos, notasAlunos);
    break;

    case "listar":
    exibeInfo(nomesAlunos, notasAlunos);
    menu(nomesAlunos, notasAlunos);
    break;
    
    case "sair":
    print("Até breve!");
    break;

    default:
    print("Ação inválida!");
  }
}

void cabecalho() {
  print("+-+-+-+-+-+-+-+ +-+-+ +-+-+-+-+-+ +-+-+-+ +-+-+-+-+-+-+");
  print("|S|i|s|t|e|m|a| |d|e| |N|o|t|a|s| |d|o|s| |A|l|u|n|o|s|");
  print("+-+-+-+-+-+-+-+ +-+-+ +-+-+-+-+-+ +-+-+-+ +-+-+-+-+-+-+");
}