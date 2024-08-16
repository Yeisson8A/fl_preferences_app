import 'package:fl_preferences_app/providers/theme_provider.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../share_preferences/preferences.dart';
import '../widgets/widgets.dart';

class SettingsScreen extends StatefulWidget {
  static const String routerName = 'Settings';
  const SettingsScreen({super.key});

  @override
  State<SettingsScreen> createState() => _SettingsScreenState();
}

class _SettingsScreenState extends State<SettingsScreen> {
  @override
  Widget build(BuildContext context) {
    final themeProvider = Provider.of<ThemeProvider>(context);

    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.grey[700],
        title: const Text('Settings', textAlign: TextAlign.center, style: TextStyle(color: Colors.white)),
      ),
      drawer: const SideMenu(),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const Text('Ajustes', style: TextStyle(fontSize: 45, fontWeight: FontWeight.w300)),
              const Divider(),
              SwitchListTile.adaptive(
                title: const Text('Darkmode'),
                value: Preferences.isDarkmode, 
                onChanged: (value) {
                  // Guardar valor en las preferencias
                  Preferences.isDarkmode = value;
                  // Cambiar el tema en el provider
                  value ? themeProvider.setDarkMode() : themeProvider.setLightMode();
                  // Redibujar por cambio de estado
                  setState(() {});
                },
              ),
              const Divider(),
              RadioListTile<int>.adaptive(
                title: const Text('Masculino'),
                value: 1, 
                groupValue: Preferences.gender, 
                onChanged: (value) {
                  // Guardar valor en las preferencias
                  Preferences.gender = value ?? 1;
                  // Redibujar por cambio de estado
                  setState(() {});
                },
              ),
              const Divider(),
              RadioListTile<int>.adaptive(
                title: const Text('Femenino'),
                value: 2, 
                groupValue: Preferences.gender, 
                onChanged: (value) {
                  // Guardar valor en las preferencias
                  Preferences.gender = value ?? 2;
                  // Redibujar por cambio de estado
                  setState(() {});
                },
              ),
              const Divider(),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 20),
                child: TextFormField(
                  initialValue: Preferences.name,
                  decoration: const InputDecoration(labelText: 'Nombre', helperText: 'Nombre de usuario'),
                  onChanged: (value) {
                    // Guardar valor en las preferencias
                    Preferences.name = value;
                    // Redibujar por cambio de estado
                    setState(() {});
                  },
                ),
              )
            ],
          ),
        ),
      )
    );
  }
}