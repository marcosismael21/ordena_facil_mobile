import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:shared_preferences/shared_preferences.dart';

class AuthService {
  final String _baseUrl = 'http://10.0.2.2:3004/api-mobile/cliente';

  Future<Map<String, dynamic>> login(String usuario, String clave) async {
    try {
      final response = await http.post(
        Uri.parse('$_baseUrl/login'),
        headers: {
          'Content-Type': 'application/json',
          'x-api-key': 'tu_api_key_para_mobile'
        },
        body: json.encode({
          'usuario': usuario,
          'clave': clave,
        }),
      );

      final data = json.decode(response.body);

      if (response.statusCode == 200 && data['token'] != null) {
        final prefs = await SharedPreferences.getInstance();
        await prefs.setString('token', data['token']);
        return {
          'success': true,
          'token': data['token'],
        };
      }
      return {
        'success': false,
        'message': data['message'] ?? 'Error en el inicio de sesión'
      };
    } catch (e) {
      print('Error en login: $e');
      return {'success': false, 'message': 'Error de conexión: $e'};
    }
  }

  Future<String?> getToken() async {
    final prefs = await SharedPreferences.getInstance();
    final token = prefs.getString('token');
    return token;
  }
}
