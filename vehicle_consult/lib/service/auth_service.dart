import 'package:flutter/material.dart';

class AuthService with ChangeNotifier {
  String? _token;
  String? _errorMessage;

  String? get token => _token;
  String? get errorMessage => _errorMessage;

  bool get isAuthenticated => _token != null;

  Future<bool> login(String username, String password) async {
    if (username == 'admin' && password == '1234') {
      _token = 'mock-token';
      _errorMessage = null;
      notifyListeners();
      return true;
    } else {
      _token = null;
      _errorMessage = 'Usuário ou senha inválidos';
      notifyListeners();
      return false;
    }
  }

  void logout() {
    _token = null;
    notifyListeners();
  }
}
