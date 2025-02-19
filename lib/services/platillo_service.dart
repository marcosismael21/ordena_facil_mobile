import 'dart:convert';
import 'package:http/http.dart' as http;
import '../models/platillo.dart';
import 'auth_service.dart';

class PlatilloService {
  final String _baseUrl = 'http://10.0.2.2:3004/api-mobile/platillo';
  final AuthService _authService = AuthService();

  Future<List<Platillo>> getAllPlatillos() async {
    try {
      final token = await _authService.getToken();
      final response = await http.get(
        Uri.parse(_baseUrl),
        headers: {
          'Content-Type': 'application/json',
          'x-api-key': 'tu_api_key_para_mobile',
          'Authorization': 'Bearer $token',
        },
      );

      if (response.statusCode == 200) {
        final Map<String, dynamic> responseData = json.decode(response.body);
        if (responseData['success'] && responseData['data'] != null) {
          print(responseData['data']);
          return (responseData['data'] as List)
              .map((item) => Platillo.fromJson(item))
              .toList();
        }
      }

      return [];
    } catch (e) {
      // ignore: avoid_print
      print('Error al obtener platillos: $e');
      return [];
    }
  }
}
