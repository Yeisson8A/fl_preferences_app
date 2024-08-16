import 'package:fl_preferences_app/providers/theme_provider.dart';
import 'package:fl_preferences_app/share_preferences/preferences.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'screens/screens.dart';

void main() async {
  // Asegurar que se inicialice la instancia
  WidgetsFlutterBinding.ensureInitialized();
  // Llamar a inicializar las preferencias
  await Preferences.init();
  runApp(
    MultiProvider(
      providers: [ChangeNotifierProvider(create: (context) => ThemeProvider(isDarkmode: Preferences.isDarkmode))],
      child: const MyApp(),
    )
  );
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Material App',
      debugShowCheckedModeBanner: false,
      theme: Provider.of<ThemeProvider>(context).currentTheme,
      initialRoute: HomeScreen.routerName,
      routes: {
        HomeScreen.routerName: ( _ ) => const HomeScreen(),
        SettingsScreen.routerName: ( _ ) => const SettingsScreen()
      },
    );
  }
}