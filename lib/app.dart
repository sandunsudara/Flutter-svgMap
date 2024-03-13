import 'package:flutter/material.dart';
import 'package:flutter_application_svg/map.dart';

class App extends StatefulWidget {
  const App({super.key});

  @override
  State<App> createState() => _AppState();
}

class _AppState extends State<App> {
  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      home: MapPage(),
    );
  }
}
