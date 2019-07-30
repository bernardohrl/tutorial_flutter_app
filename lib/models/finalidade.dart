class Finalidade {
  int id;
  String nome;
  String icone;
  String routerLink;
  bool ativo;

  Finalidade({this.id, this.nome, this.icone, this.routerLink, this.ativo});

  Finalidade jsonToFinalidade(data) {
    return Finalidade(
      id: data['id'],
      nome: data['nome'],
      icone: data['icone'],
      routerLink: data['routerLink'],
      ativo: data['ativo']
    );
  }
}