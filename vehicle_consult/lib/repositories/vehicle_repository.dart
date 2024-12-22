import 'dart:convert';
import 'package:http/http.dart' as http;
import '../models/vehicle.dart';

class VehicleRepository {
  final String baseUrl = 'http://localhost:3000/vehicles';

  Future<Vehicle?> fetchByPlate(String plate) async {
    final response = await http.get(Uri.parse('$baseUrl/$plate'));
    if (response.statusCode == 200) {
      return Vehicle.fromJson(jsonDecode(response.body));
    } else {
      throw Exception('Veículo não encontrado');
    }
  }

  Future<Vehicle?> fetchByChassi(String chassi) async {
    final response = await http.get(Uri.parse('$baseUrl/chassi/$chassi'));
    if (response.statusCode == 200) {
      return Vehicle.fromJson(jsonDecode(response.body));
    } else {
      throw Exception('Veículo não encontrado');
    }
  }

  Future<Vehicle?> fetchByMotor(String motor) async {
    final response = await http.get(Uri.parse('$baseUrl/motor/$motor'));
    if (response.statusCode == 200) {
      return Vehicle.fromJson(jsonDecode(response.body));
    } else {
      throw Exception('Veículo não encontrado');
    }
  }
}
