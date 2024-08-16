import 'package:fl_preferences_app/share_preferences/preferences.dart';
import 'package:flutter/material.dart';
import '../widgets/widgets.dart';

class HomeScreen extends StatelessWidget {
  static const String routerName = 'Home';
  const HomeScreen({super.key});
  
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.grey[700],
        title: const Text('Home', textAlign: TextAlign.center, style: TextStyle(color: Colors.white)),
      ),
      drawer: const SideMenu(), // Menú lateral
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text('Is Darkmode: ${Preferences.isDarkmode}'),
          const Divider(),
          Text('Género: ${Preferences.gender == 1 ? 'Masculino' : 'Femenino'}'),
          const Divider(),
          Text('Nombre de usuario: ${Preferences.name}'),
          const Divider()
        ],
      )
    );
  }
}