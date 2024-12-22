import 'package:flutter/material.dart';
import 'package:vehicle_consult/theme/style.dart';
import '../models/cpf.dart';

class CpfCard extends StatelessWidget {
  final CpfData cpfData;

  const CpfCard({Key? key, required this.cpfData}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Card(
      color: cardColor,
      child: Padding(
        padding: const EdgeInsets.all(10.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text('Nome: ${cpfData.nome}',
                style: const TextStyle(fontWeight: FontWeight.bold)),
            Text('Data de Nascimento: ${cpfData.dataNascimento}'),
            Text('Sexo: ${cpfData.sexo}'),
            Text('Situação Cadastral: ${cpfData.situacaoCadastral}'),
          ],
        ),
      ),
    );
  }
}
