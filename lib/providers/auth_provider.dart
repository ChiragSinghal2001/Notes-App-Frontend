import 'package:flutter/material.dart';
import 'package:notes_app/services/auth_services.dart';

class AuthProvider with ChangeNotifier {
  final AuthService _authService = AuthService();
  bool _isLoading = false;
  bool get isLoading => _isLoading;

  set isLoading(bool value) {
    _isLoading = value;
    notifyListeners();
  }

  Future<bool> login({String? email, String? password}) async {
    isLoading = true;
    try {
      final response =
          await _authService.login(email: email, password: password);
      if (response.statusCode == 200) {
        print('Login successful');
        isLoading = false;
        return true;
      } else {
        print('Login failed');
        isLoading = false;
        return false;
      }
    } catch (e) {
      print('Error occurred during login: $e');
      isLoading = false;
      return false;
    }
  }

  Future<bool> signup({String? email, String? password}) async {
    isLoading = true;
    try {
      final response =
          await _authService.signup(email: email, password: password);
      if (response.statusCode == 201) {
        print('Signup successful');
        isLoading = false;
        return true;
      } else {
        print('Signup failed');
        isLoading = false;
        return false;
      }
    } catch (e) {
      print('Error occurred during signup: $e');
      isLoading = false;
      return false;
    }
  }
}
