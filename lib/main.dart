import 'package:flutter/material.dart';

import 'core/di/injection.dart';
import 'presentation/screens/auth/login_screen.dart';
import 'presentation/widgets/bottom_nav/balto_bottom_nav_bar.dart';

void main() {
  setupDependencies();
  runApp(const BaltoApp());
}

class BaltoApp extends StatelessWidget {
  const BaltoApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Balto',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: const Color(0xFF3A80C2)),
        useMaterial3: true,
      ),
      home: const LoginScreen(),
    );
  }
}

class MainShell extends StatefulWidget {
  const MainShell({super.key});

  @override
  State<MainShell> createState() => _MainShellState();
}

class _MainShellState extends State<MainShell> {
  int _currentIndex = 0;

  static const List<String> _pageTitles = [
    'Home',
    'Walks',
    'Walkers',
    'Coach',
    'Profile',
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFF5F5F5),
      body: Center(
        child: Text(
          _pageTitles[_currentIndex],
          style: const TextStyle(fontSize: 28, fontWeight: FontWeight.bold),
        ),
      ),
      bottomNavigationBar: BaltoBottomNavBar(
        currentIndex: _currentIndex,
        onTap: (index) => setState(() => _currentIndex = index),
      ),
    );
  }
}
