import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import '../login_page.dart';

class PerfilPage extends StatelessWidget {
  const PerfilPage({super.key});

  Future<void> _cerrarSesion(BuildContext context) async {
    final prefs = await SharedPreferences.getInstance();
    await prefs.clear(); // Borra todas las preferencias almacenadas

    // Navegar a la página de login y eliminar todas las rutas anteriores
    Navigator.of(context).pushAndRemoveUntil(
      MaterialPageRoute(builder: (context) => const LoginPage()),
      (Route<dynamic> route) => false,
    );
  }

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          const Text('Mi Perfil'),
          const SizedBox(height: 20),
          ElevatedButton(
            onPressed: () => _cerrarSesion(context),
            style: ElevatedButton.styleFrom(
              backgroundColor: Colors.red,
              padding: const EdgeInsets.symmetric(horizontal: 30, vertical: 15),
            ),
            child: const Text(
              'Cerrar Sesión',
              style: TextStyle(fontSize: 16),
            ),
          ),
        ],
      ),
    );
  }
}