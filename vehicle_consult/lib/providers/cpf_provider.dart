import 'package:flutter/material.dart';
import '../models/cpf.dart';
import '../repositories/cpf_repository.dart';

class CpfProvider with ChangeNotifier {
  final CpfRepository _repository = CpfRepository();
  CpfData? _cpfData;
  String? _errorMessage;
  bool _isLoading = false;

  CpfData? get cpfData => _cpfData;
  String? get errorMessage => _errorMessage;
  bool get isLoading => _isLoading;

  Future<void> searchCpf(String cpf) async {
    _isLoading = true;
    notifyListeners();
    try {
      _cpfData = await _repository.fetchCpfData(cpf);
      _errorMessage = null;
    } catch (e) {
      _cpfData = null;
      _errorMessage = e.toString();
    } finally {
      _isLoading = false;
      notifyListeners();
    }
  }

  void clearData() {
    _cpfData = null;
    _errorMessage = null;
    notifyListeners();
  }
}
