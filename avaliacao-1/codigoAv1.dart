import 'dart:convert';

class Dependente {
  late String _nome;

  Dependente(String nome) {
    this._nome = nome;
  }

  Map<String, dynamic> toJson() {
    return {
      'nome': _nome,
    };
  }
}

class Funcionario {
  late String _nome;
  late List<Dependente> _dependentes;

  Funcionario(String nome, List<Dependente> dependentes) {
    this._nome = nome;
    this._dependentes = dependentes;
  }

  Map<String, dynamic> toJson() {
    return {
      'nome': _nome,
      'dependentes': _dependentes.map((d) => d.toJson()).toList(),
    };
  }
}

class EquipeProjeto {
  late String _nomeProjeto;
  late List<Funcionario> _funcionarios;

  EquipeProjeto(String nomeprojeto, List<Funcionario> funcionarios) {
    _nomeProjeto = nomeprojeto;
    _funcionarios = funcionarios;
  }

  Map<String, dynamic> toJson() {
    return {
      'nomeProjeto': _nomeProjeto,
      'funcionarios': _funcionarios.map((f) => f.toJson()).toList(),
    };
  }
}

void main() {
  
  // 1. Criando vários objetos Dependente
  var dependente1 = Dependente('Carlos');
  var dependente2 = Dependente('Ana');
  var dependente3 = Dependente('Pedro');
  var dependente4 = Dependente('Sofia');

  // 2. Criando vários objetos Funcionario
  var funcionario1 = Funcionario('Lays', [dependente1]);
  var funcionario2 = Funcionario('Lara', [dependente2]);
  var funcionario3 = Funcionario('Paulo', [dependente3]);
  var funcionario4 = Funcionario('Peter', [dependente4]);
  

  // 3. Associar os Dependentes criados aos respectivos funcionários
  // Isso já foi feito na etapa 2 ao criar os funcionários com os dependentes.

  // 4. Criar uma lista de Funcionários
  var funcionarios = [funcionario1, funcionario2, funcionario3, funcionario4];

  // 5. Criar um objeto Equipe Projeto chamando o método construtor que dá nome ao projeto e insere uma coleção de funcionários
  var equipeProjeto = EquipeProjeto('Projeto 409', funcionarios);

  // 6. Printar no formato JSON o objeto Equipe Projeto
  var equipeProjetoJson = jsonEncode(equipeProjeto.toJson());
  print(equipeProjetoJson);
}
