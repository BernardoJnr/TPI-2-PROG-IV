import 'dart:convert';

import 'package:http/http.dart' as http;
import '../models/cpf.dart';

class CpfRepository {
  final String baseUrl = 'http://localhost:3000/cpf';

  Future<CpfData> fetchCpfData(String cpf) async {
    final response = await http.get(
      Uri.parse('$baseUrl/$cpf'),
    );

    if (response.statusCode == 200) {
      final json = response.body;
      return CpfData.fromJson(jsonDecode(json));
    } else {
      throw Exception('Falha ao buscar dados do CPF');
    }
  }
}
