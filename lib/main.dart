import 'package:aplication_colores_page/pages/launcher_page.dart';
import 'package:aplication_colores_page/theme.dart/theme.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

void main() => runApp(ChangeNotifierProvider(
    create: (BuildContext context) => ThemeChanger(2),
    child: const MyApp()));

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    final themeapp = Provider.of<ThemeChanger>(context);
    return  MaterialApp(
      title: 'theme App',
      home: const LauncherPage(),
      debugShowCheckedModeBanner: false,
      theme: themeapp.currenttheme// themeapp.darltheme == true ? ThemeData.dark() : ThemeData.light(),
    );
  }
}
