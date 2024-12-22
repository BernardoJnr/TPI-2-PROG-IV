class CpfData {
  final String nome;
  final String dataNascimento;
  final String sexo;
  final String situacaoCadastral;

  CpfData({
    required this.nome,
    required this.dataNascimento,
    required this.sexo,
    required this.situacaoCadastral,
  });

  factory CpfData.fromJson(Map<String, dynamic> json) {
    return CpfData(
      nome: json['nome'],
      dataNascimento: json['dataNascimento'],
      sexo: json['sexo'],
      situacaoCadastral: json['situacaoCadastral'],
    );
  }
}
