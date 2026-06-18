import 'package:flutter/material.dart';

class NavItemModel {
  const NavItemModel({
    required this.label,
    required this.icon,
    required this.accentColor,
  });

  final String label;
  final IconData icon;
  final Color accentColor;
}
