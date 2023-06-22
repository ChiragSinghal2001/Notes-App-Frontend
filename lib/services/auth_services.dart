import 'package:http/http.dart';

class AuthService {
  Future<Response> login({String? email, String? password}) async {
    try {
      Response response = await post(
        Uri.parse('https://backend-six-jade.vercel.app/khelo/login'),
        body: {'email': email, 'password': password},
      );
      return response;
    } catch (e) {
      print('Error occurred during login: $e');
      rethrow;
    }
  }

  Future<Response> signup({String? email, String? password}) async {
    try {
      Response response = await post(
        Uri.parse('https://backend-six-jade.vercel.app/khelo/signup'),
        body: {'email': email, 'password': password},
      );
      return response;
    } catch (e) {
      print('Error occurred during signup: $e');
      rethrow;
    }
  }
}
