import 'package:flutter/material.dart';
import '../models/vehicle.dart';
import '../repositories/vehicle_repository.dart';

class VehicleProvider with ChangeNotifier {
  final VehicleRepository _repository = VehicleRepository();
  Vehicle? _vehicle;
  String? _errorMessage;

  Vehicle? get vehicle => _vehicle;
  String? get errorMessage => _errorMessage;

  Future<void> searchVehicle(String query, String type) async {
    try {
      if (type == 'plate') {
        _vehicle = await _repository.fetchByPlate(query);
      } else if (type == 'chassi') {
        _vehicle = await _repository.fetchByChassi(query);
      } else if (type == 'motor') {
        _vehicle = await _repository.fetchByMotor(query);
      }
      _errorMessage = null;
    } catch (e) {
      _vehicle = null;
      _errorMessage = e.toString();
    }
    notifyListeners();
  }

  void clearData() {
    _vehicle = null;
    _errorMessage = null;
    notifyListeners();
  }
}
